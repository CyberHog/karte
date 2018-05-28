class PatientsReceiptsController < ApplicationController
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
  end

  # 登録
  def new
    @menu_name = Menu.where(user_id: current_user.id).pluck(:content_name)
    @menu_point = Menu.where(user_id: current_user.id).pluck(:attached_point)
    @menu_price = Menu.where(user_id: current_user.id).pluck(:price)
    @user = User.find(params[:user_id])
  	@patients_receipt = PatientsReceipt.new(payday: Time.current)
    @patients_receipt.user_id = @user.id
    @patients_receipt.receipts.build
    @coupon = Coupon.new
    @coupon.user_id = @user.id
  end

  # 作成
  def create
    @user = User.find(params[:user_id])
    @patients_receipt = PatientsReceipt.new(patients_receipt_params)
    @patients_receipt.buyer = @user
    if @patients_receipt.save
      redirect_to user_patients_receipt_url(id: @patients_receipt.id), notice: "登録完了しました"
    else
      render "new"
    end

    @coupon = Coupon.new(coupon_params)
    @coupon.buyer = @user
    if @coupon.save
      recirect_to user_patients_receipt_url(id: @patients_receipt.id), notice: "登録完了しました"
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
  	@patients_receipt = PatientsReceipt.find(params[:id])
  end

  # 更新
  def update
  	@patients_receipt = PatientsReceipt.find(params[:id])
  	@patients_receipt.assign_attributes(patients_receipt_params)
  	if @patients_receipt.save
  		redirect_to user_patients_receipt_url(id: @patients_receipt.id), notice: "登録情報を変更しました"
  	else
  		render "edit"
  	end
  end

  # 削除
  def destroy
  	@patients_receipt = PatientsReceipt.find(params[:id])
  	@patients_receipt.destroy
  	redirect_to user_patients_receipts_url(id: @patients_receipt.id), notice: "登録除法を削除しまた"
  end

  private
  def patients_receipt_params
  	params.require(:patients_receipt).permit(:id, :user_id, :seller_id, :buyer_id, :payday, :payer,
     receipts_attributes: [:id, :patients_receipt_id, :service, :payment, :gained_point, :payment_method, :_destroy])
  end

  def coupon_params
    params.require(:coupon).permit(:id, :user_id, :seller_id, :buyer_id, :name, :remaining, :expiration_date)
  end
end
