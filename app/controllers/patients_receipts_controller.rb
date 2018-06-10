class PatientsReceiptsController < ApplicationController
  # テーブル一覧
  def index
    @user = current_user
    @patients_receipts = @user.issued_receipts
  	@patients_receipts = PatientsReceipt.order(:payday).page(params[:page]).per(10)
  end

  # 詳細
  def show
  	@patients_receipt = PatientsReceipt.find(params[:id])
    @user = User.find_by(id: @patients_receipt.seller_id)
    @patients_receipt.receipts.each do |receipt|
      @course = receipt.service
    end
    @selected_menu = Menu.find_by(user_id: @user.id, content_name: @course.to_s)
  end

end
