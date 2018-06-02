class CouponsController < ApplicationController
  def index
  	if params[:user_id]
  	  @user = User.find(params[:user_id])
  	  @coupons = @user.issued_coupons
  	else
  	  @coupons = Coupon.all
  	end
  	@coupons = Coupon.order(:id)
  end

  def show
  	@user = User.find(params[:user_id])
  	@coupon = Coupon.find(params[:id])
    @coupon_life = (( @coupon.expiration_date - Time.now )/(60 * 60 * 24)).to_i
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
    @expiration_date = @patients_receipt.created_at + validity*(60*60*24)
    @coupon_life = (( @expiration_date - Time.now )/(60 * 60 * 24)).to_i
    @user = User.find(params[:user_id])
    @coupon = Coupon.new
    @coupon.user_id = @user.id
  end

  def create
    @user = User.find(params[:user_id])
    @coupon = Coupon.new(coupon_params)
    @coupon.buyer = @user
    if @coupon.save
      redirect_to user_patients_receipts_url(:patients_receipt_id => @coupon.patients_receipt_id), notice: "登録完了しました"
    else
      render "new"
    end
  end

  def edit
  	@user = User.find(prams[:user_id])
  	@coupon = Coupon.find(params[:id])
  end

  def update
  	@coupon = Coupon.find(params[:id])
  	@coupon.assign_attributes(coupon_params)
  	if @coupon.save
  		redirect_to user_coupons_url(id: @coupon.id), notice: "クーポンを更新しました"
  	else
  		render "edit"
  	end
  end

  def destroy
  	@coupon = Coupon.find(params[:id])
  	@coupon.destroy
  	redirect_to user_coupons_url(id: @coupon.id), notice: "クーポンを削除しました"
  end

  private
  def coupon_params
  	params.require(:coupon).permit(:patients_receipt_id, :seller_id, :buyer_id, :name, :remaining, :expiration_date)
  end
end
