class PatientsReceiptsController < ApplicationController
  # テーブル一覧
  def index
  	@patients_receipts = PatientsReceipt.order(:id)
      .page(params[:page]).per(10)
  end

  # 詳細
  def show
  	@patients_receipt = PatientsReceipt.find(params[:id])
  end

  # 登録
  def new
  	@patients_receipt = PatientsReceipt.new
    @patients_receipt.receipts.build
  end

  # 編集
  def edit
  	@patients_receipt = PatientsReceipt.find(params[:id])
  end

  # 作成
  def create
  	@patients_receipt = PatientsReceipt.new(patients_receipt_params)
  	if @patients_receipt.save
  		redirect_to @patients_receipt, notice: "登録完了しました"
  	else
  		render "new"
  	end
  end

  # 更新
  def update
  	@patients_receipt = PatientsReceipt.find(params[:id])
  	@patients_receipt.assign_attributes(patients_receipt_params)
  	if @patients_receipt.save
  		redirect_to @patients_receipt, notice: "登録情報を変更しました"
  	else
  		render "edit"
  	end
  end

  # 削除
  def destroy
  	@patients_receipt = PatientsReceipt.find(params[:id])
  	@patients_receipt.destroy
  	redirect_to :patients_receipts, notice: "登録除法を削除しまた"
  end

  private
  def patients_receipt_params
  	params.require(:patients_receipt).permit(receipts_attributes: [:id, :patients_receipt_id, :payday, :service, :payment, :gained_point, :payment_method, :payee, :_destroy])
  end
end
