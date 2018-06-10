class CouponsController < ApplicationController
  def index
  	@user = current_user
  	@coupons = @user.issued_coupons
  	@coupons = Coupon.order(:id)
    @coupons.each do |coupon|
      @coupon_life = (coupon.expiration_date.to_datetime - DateTime.now).to_i
    end

  end

  def search
    @user = current_user
    @coupons = Coupon.search(params[:q])
    render "index"
  end

  def show
  	@user = current_user
  	@coupon = Coupon.find(params[:id])
    @coupon_life = (@coupon.expiration_date.to_datetime - DateTime.now).to_i
  end

end
