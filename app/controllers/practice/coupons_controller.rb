class Practice::CouponsController < Practice::Base
  def index
  	if params[:user_id]
  	  @user = User.find(params[:user_id])
  	  @coupons = @user.issued_coupons
  	else
  	  @coupons = Coupon.all
  	end
  	@coupons = Coupon.order(:id)
    @coupons.each do |coupon|
      @coupon_life = (coupon.expiration_date.to_datetime - DateTime.now).to_i
    end

  end

  def search
    @user = User.find(params[:user_id])
    @coupons = Coupon.search(params[:q])
    render "index"
  end

  def show
  	@user = User.find(params[:user_id])
  	@coupon = Coupon.find(params[:id])
    @coupon_life = (@coupon.expiration_date.to_datetime - DateTime.now).to_i
  end

  def new
    require 'time'
    @patients_receipt = PatientsReceipt.find(params[:patients_receipt_id])
    @patients_receipt.receipts.each do |receipt|
      @course = receipt.service
    end
    selected_menu = Menu.find_by(user_id: current_user.id, content_name: @course.to_s)
    @remaining = selected_menu.counting
    validity = selected_menu.validity_period
    @menu_id = selected_menu.id
    @expiration_date = @patients_receipt.created_at.to_datetime + validity
    @coupon_life = (@expiration_date - DateTime.now).to_i
    @user = User.find(params[:user_id])
    @coupon = Coupon.new(expiration_date: @expiration_date.strftime("%Y/%m/%d"))
    @coupon.user_id = @user.id
  end

  def create
    @user = User.find(params[:user_id])
    @coupon = Coupon.new(coupon_params)
    @coupon.buyer = @user
    if @coupon.save
      redirect_to practice_user_patients_receipts_url(:patients_receipt_id => @coupon.patients_receipt_id), notice: "登録完了しました"
    else
      render "new"
    end
  end

  def edit
  	@user = User.find(params[:user_id])
  	@coupon = Coupon.find(params[:id])
    @patients_receipt = PatientsReceipt.find_by(id: @coupon.patients_receipt_id)
    @patients_receipt.receipts.each do |receipt|
      @course = receipt.service
    end
    selected_menu = Menu.find_by(user_id: current_user.id, content_name: @course.to_s)
    @remaining = selected_menu.counting
    validity = selected_menu.validity_period
    @expiration_date = @patients_receipt.created_at.to_time + validity*(60*60*24)
    @coupon_life = (( @expiration_date - Time.now )/(60 * 60 * 24)).to_i
  end

  def update
  	@coupon = Coupon.find(params[:id])
  	@coupon.assign_attributes(coupon_params)
  	if @coupon.save
  		redirect_to practice_user_coupons_url(id: @coupon.id), notice: "クーポンを更新しました"
  	else
  		render "edit"
  	end
  end

  def destroy
  	@coupon = Coupon.find(params[:id])
  	@coupon.destroy
  	redirect_to practice_user_coupons_url(id: @coupon.id), notice: "クーポンを削除しました"
  end

  private
  def coupon_params
  	params.require(:coupon).permit(:menu_id, :patients_receipt_id, :seller_id, :buyer_id, :coupon_name, :remaining, :expiration_date)
  end
end
