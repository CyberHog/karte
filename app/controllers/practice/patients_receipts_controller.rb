class Practice::PatientsReceiptsController < Practice::Base
  # テーブル一覧
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @patients_receipts = @user.issued_receipts
    else
      @patients_receipts = PatientsReceipt.all
    end
  	@patients_receipts = PatientsReceipt.order(:payday).page(params[:page]).per(10)
  end

  # 詳細
  def show
    @user = User.find(params[:user_id])
  	@patients_receipt = PatientsReceipt.find(params[:id])
    @patients_receipt.receipts.each do |receipt|
      @course = receipt.service
    end
    @selected_menu = Menu.find_by(user_id: current_user.id, content_name: @course.to_s)
  end

  # 登録
  def new
    @menu_name = Menu.where(user_id: current_user.id).pluck(:content_name)
    @menu_point = Menu.where(user_id: current_user.id).pluck(:attached_point)
    @menu_price = Menu.where(user_id: current_user.id).pluck(:price)
    @user = User.find(params[:user_id])
    @card = ClinicCard.find_by(holder_id: @user.id, publisher_id: current_user.id)
  	@patients_receipt = PatientsReceipt.new(payday: Time.current)
    @patients_receipt.buyer_id = @user.id
    @patients_receipt.receipts.build
  end

  # 作成
  def create
    @user = User.find(params[:user_id])
    @patients_receipt = PatientsReceipt.new(patients_receipt_params)
    @patients_receipt.buyer = @user
    @menu_name = Menu.where(user_id: current_user.id).pluck(:content_name)
    @menu_point = Menu.where(user_id: current_user.id).pluck(:attached_point)
    @menu_price = Menu.where(user_id: current_user.id).pluck(:price)
    @card = ClinicCard.find_by(holder_id: @user.id, publisher_id: current_user.id)

    # @payment支払い金額,@payment_method支払い方法,@point取得ポイント
    @patients_receipt.receipts.each do |receipt|
      @payment = receipt.payment
      @payment_method = receipt.payment_method
      @point = receipt.gained_point
    end
    save_valid = true
    # 支払いがクーポンの場合
    if @payment_method == "クーポン"  
      if @user.received_coupons
      	@using_coupon = Coupon.find_by(seller_id: current_user.id, buyer_id: @user.id)
        @count = @using_coupon.remaining # @count,クーポンの残り回数
        # 使用可能回数が残っている場合
      	if @count
          used = @using_coupon.remaining - 1 
          @using_coupon.assign_attributes(remaining: used)
          if @count == 0 # 使用後に残り回数が0になったら
            @using_coupon.destroy
          else
            @using_coupon.save
          end
        else
          save_valid = false
          message =  "クーポンは使用済みです"
        end
      else
      	save_valid = false
        message =  "クーポンを所有していません"
	  end
    # 支払が現金またはカードの場合
    elsif @payment_method == "現金" || @payment_method == "カード"
      @clinic_card = ClinicCard.find_by(publisher_id: current_user.id, holder_id: @user.id)
      @holding_point = @clinic_card.holding_point
      added = @clinic_card.holding_point + @point
      @clinic_card.assign_attributes(holding_point: added)
      @clinic_card.save
    # 支払いがポイントの場合
    elsif @payment_method == "ポイント"
      @clinic_card = ClinicCard.find_by(publisher_id: current_user.id, holder_id: @user.id)
      @holding_point = @clinic_card.holding_point
      if @holding_point >= @payment
        used_point = @clinic_card.holding_point - @payment
        @clinic_card.assign_attributes(holding_point: used_point)
        @clinic_card.save
      else
        save_valid = false
        message = "ポイントが不足しています。"
      end
    end
    if save_valid
      if @patients_receipt.save
        redirect_to practice_user_patients_receipt_url(id: @patients_receipt.id), notice: "会計情報の登録が完了しました"
      else
        flash[:notice] = message
        render "new"
      end
    else
      flash[:notice] = message
      render "new"
    end
  end

  # 編集
  def edit
    @menu_name = Menu.where(user_id: current_user.id).pluck(:content_name)
    @menu_point = Menu.where(user_id: current_user.id).pluck(:attached_point)
    @menu_price = Menu.where(user_id: current_user.id).pluck(:price)
    @user = User.find(params[:user_id])
    @card = ClinicCard.find_by(holder_id: @user.id, publisher_id: current_user.id)
  	@patients_receipt = PatientsReceipt.find(params[:id])
  end

  # 更新
  def update
  	@user = User.find(params[:user_id])
  	@clinic_card = ClinicCard.find_by(publisher_id: current_user.id, holder_id: @user.id)
    @holding_point = @clinic_card.holding_point
  	@patients_receipt = PatientsReceipt.find(params[:id])
  	@patients_receipt.receipts.each do |receipt|
      @before_payment = receipt.payment
      @before_payment_method = receipt.payment_method
      @before_point = receipt.gained_point
      @before_selected_menu = receipt.service
    end
    if @before_payment_method == "クーポン"
      if @user.received_coupons
      	@using_coupon = Coupon.find_by(seller_id: current_user.id, buyer_id: @user.id)
      	@user.received_coupons.each do |coupon|
  	      @menu_id = coupon.menu_id
  	      @patients_receipt_id = coupon.patients_receipt_id
  	      @seller_id = coupon.seller_id
  	      @buyer_id = coupon.buyer_id
  	      @coupon_name = coupon.coupon_name
          @count = coupon.remaining # @count,クーポンの残り回数
          @expiration_date = coupon.expiration_date
        end
      end
    end
  	@patients_receipt.assign_attributes(patients_receipt_params)
  	@patients_receipt.receipts.each do |receipt|
      @after_payment = receipt.payment
      @after_payment_method = receipt.payment_method
      @after_point = receipt.gained_point
  	end
  	save_valid = true

  	# 編集後の支払いがクーポン
  	if @after_payment_method == "クーポン"
  	  if @user.received_coupons
  	    if @count
  	      # 現金、またはカード → クーポン
  	      if @before_payment_method == "現金" || @before_payment_method == "カード"
      	    changed_point = @holding_point - @before_point
      	    @clinic_card.assign_attributes(holding_point: changed_point)
      	    @clinic_card.save
      	    used = @using_coupon.remaining - 1 
            @using_coupon.assign_attributes(remaining: used)
            if @using_coupon.remaining == 0
              @using_coupon.destroy
            else
              @using_coupon.save
            end
          # ポイント → クーポン
  	      elsif @before_payment_method == "ポイント"
            unused_point = @holding_point + @before_payment
            @clinic_card.assign_attributes(holding_point: unused_point)
       	    @clinic_card.save
      	    used = @using_coupon.remaining - 1 
            @using_coupon.assign_attributes(remaining: used)
            if @using_coupon.remaining == 0
              @using_coupon.destroy
            else
              @using_coupon.save
            end
      	  end
        else
      	  save_valid = false
      	  message =  "クーポンは使用済みです"
        end 
      else
      	save_valid = false
        message =  "クーポンを所有していません"
	  end

    # 編集後の支払が現金またはカードの場合   
  	elsif @after_payment_method == "現金" || @after_payment_method == "カード"
  	  # クーポン → 現金orカード
  	  if @before_payment_method == "クーポン"
  	  	if @user.received_coupons
  	  	  unused = @count + 1
  	  	  @using_coupon.assign_attributes(remaining: unused)
  	  	  @using_coupon.save
          added = @holding_point + @after_point
      	  @clinic_card.assign_attributes(holding_point: added)
      	  @clinic_card.save
      	else
      	  added = @holding_point + @after_point
      	  @clinic_card.assign_attributes(holding_point: added)
      	  @clinic_card.save
      	  @menu = Menu.where(content_name: @before_selected_menu)
      	  @coupon = Coupon.create(menu_id: @menu.id, patients_receipt_id: @patients_receipt.id, seller_id: @seller_id, buyer_id: @buyer_id, coupon_name: @before_selected_menu, remaining: 1)
      	  message = "クーポンの有効期限を再設定してください"
      	end
      # ポイント → 現金orカード
      elsif @before_payment_method == "ポイント"
      	unused_point = @holding_point + @before_payment
        @clinic_card.assign_attributes(holding_point: unused_point)
        @clinic_card.save
        added = @holding_point + @after_point
      	@clinic_card.assign_attributes(holding_point: added)
      	@clinic_card.save
      # 現金orカード → 現金orカード
      elsif @before_payment_method == "現金" || @before_payment_method == "カード"
      	reset_point = 0
 		reset_point = @holding_point + @after_point - @before_point
      	@clinic_card.assign_attributes(holding_point: reset_point)
      	@clinic_card.save
      end

    # 修正後の支払いがポイント
    elsif @after_payment_method == "ポイント"
  	  if @holding_point
  	    # クーポン → ポイント
  	    if @before_payment_method == "クーポン"
          if @user.received_coupons
  	  	    unused = @count + 1
  	  	    @using_coupon.assign_attributes(remaining: unused)
  	  	    @using_coupon.save
            used = @holding_point - @before_payment
      	    @clinic_card.assign_attributes(holding_point: used)
      	    @clinic_card.save
      	  else
      	    used = @holding_point - @before_payment
      	    @clinic_card.assign_attributes(holding_point: used)
      	    @clinic_card.save
      	    @menu = Menu.where(content_name: @before_selected_menu)
      	    @coupon = Coupon.create(menu_id: @menu.id, patients_receipt_id: @patients_receipt.id, seller_id: @seller_id, buyer_id: @buyer_id, coupon_name: @before_selected_menu, remaining: 1)
      	    message = "クーポンの有効期限を再設定してください"
      	  end
        # 現金orカード → ポイント
  	    elsif @before_payment_method == "カード" || @befor_payment_method == "現金"
  	      changed_point = @holding_point - @before_point - @before_payment
          @clinic_card.assign_attributes(holding_point: used)
          @clinic_card.save
        elsif @before_payment_method == "ポイント"
      	  changed_point = @holding_point + @before_payment - @after_payment
      	  @clinic_card.assign_attributes(holding_point: changed_point)
      	  @clinic_card.save
        end
  	  else
  	    save_valid = false
        message = "ポイントが不足しています。"
      end
    end
    if save_valid
  	  if @patients_receipt.save
  	  	redirect_to practice_user_patients_receipt_url(id: @patients_receipt.id), notice: "会計情報を変更しました"
  	  else
        flash[:notice] = message
        render "edit"
      end
    else
      flash[:notice] = message
      render "edit"
    end
  end

  # 削除
  def destroy
  	@user = User.find(params[:user_id])
  	@clinic_card = ClinicCard.find_by(publisher_id: current_user.id, holder_id: @user.id)
    @holding_point = @clinic_card.holding_point
  	@patients_receipt = PatientsReceipt.find(params[:id])
  	@patients_receipt.receipts.each do |receipt|
      @payment = receipt.payment
      @payment_method = receipt.payment_method
      @point = receipt.gained_point
    end
    if @payment_method == "クーポン"
      @using_coupon = Coupon.find_by(seller_id: current_user.id, buyer_id: @user.id)
      @user.received_coupons.each do |coupon|
  	    @menu_id = coupon.menu_id
  	    @patients_receipt_id = coupon.patients_receipt_id
  	    @seller_id = coupon.seller_id
  	    @buyer_id = coupon.buyer_id
  	    @coupon_name = coupon.coupon_name
        @count = coupon.remaining # @count,クーポンの残り回数
        @expiration_date = coupon.expiration_date
      end
    end
  	@patients_receipt.destroy
  	if @payment_method == "クーポン"
      if @count
        unused = @using_coupon.remaining + 1 
        @using_coupon.assign_attributes(remaining: unused)
       	@using_coupon.save
      else
      	@coupon = Coupon.create(menu_id: @menu_id, patients_receipt_id: @patients_receipt_id, seller_id: @seller_id, buyer_id: @buyer_id, coupon_name: @coupon_name, remaining: 1, expiration_date: @expiration_date)
      end
  	elsif @payment_method == "ポイント"
      unused_point = @clinic_card.holding_point + @payment
      @clinic_card.assign_attributes(holding_point: unused_point)
      @clinic_card.save
  	elsif @payment_method == "現金" || @payment_method == "カード"
      unadded = @clinic_card.holding_point - @point
      @clinic_card.assign_attributes(holding_point: unadded)
      @clinic_card.save
  	end
  	redirect_to practice_user_patients_receipts_url(id: @patients_receipt.id), notice: "会計情報を削除しまた"
  end

  private
  def patients_receipt_params
  	params.require(:patients_receipt).permit(:clinic_card_id, :id, :seller_id, :buyer_id, :payday, :payer,
     receipts_attributes: [:id, :patients_receipt_id, :service, :payment, :gained_point, :payment_method, :_destroy])
  end
end
