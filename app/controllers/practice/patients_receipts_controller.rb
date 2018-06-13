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

    # @payment支払い金額,@payment_method支払い方法,@point取得ポイント
    @patients_receipt.receipts.each do |receipt|
      @payment = receipt.payment
      @payment_method = receipt.payment_method
      @point = receipt.gained_point
    end
    save_valid = true
    # 支払いがクーポンの場合
    if @payment_method == "クーポン"  
      @user.received_coupons.each do |coupon|
        @count = coupon.remaining # @count,クーポンの残り回数
      end
      @using_coupon = Coupon.find_by(seller_id: current_user.id, buyer_id: @user.id)
      # 使用可能回数が残っている場合
      if @count
        used = @using_coupon.remaining - 1 
        @using_coupon.assign_attributes(remaining: used)
        if @using_coupon.remaining == 0
          @using_coupon.destroy
        else
          @using_coupon.save
        end
      else
        save_valid = false
        render "new", notice: "クーポンは使用済みです"
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
        render "new", notice: "ポイントが不足しています。"
      end
    end
    if save_valid
      if @patients_receipt.save
        redirect_to practice_user_patients_receipt_url(id: @patients_receipt.id), notice: "会計情報の登録が完了しました"
      else
        render "new"
      end
    else
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
  	@patients_receipt = PatientsReceipt.find(params[:id])
  	@patients_receipt.assign_attributes(patients_receipt_params)
  	if @patients_receipt.save
  		redirect_to practice_user_patients_receipt_url(id: @patients_receipt.id), notice: "会計情報を変更しました"
  	else
  		render "edit"
  	end
  end

  # 削除
  def destroy
  	@patients_receipt = PatientsReceipt.find(params[:id])
  	@patients_receipt.destroy
  	redirect_to practice_user_patients_receipts_url(id: @patients_receipt.id), notice: "会計情報を削除しまた"
  end

  private
  def patients_receipt_params
  	params.require(:patients_receipt).permit(:clinic_card_id, :id, :seller_id, :buyer_id, :payday, :payer,
     receipts_attributes: [:id, :patients_receipt_id, :service, :payment, :gained_point, :payment_method, :_destroy])
  end
end
