class CouponsController < ApplicationController
  def index
  	if params[:user_id]
  	  @user = User.find(params[:user_id])
  	  @coupons = @user.coupons
  	else
  	  @coupons = Coupon.all
  	end
  	@coupons = Coupon.order("id")
  end

  def show
  	@user = User.find(params[:user_id])
  	@coupon = Coupon.find(params[:id])
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
  	params.require(:coupon).premit(:name, :remaining, :expiration_date)
end
