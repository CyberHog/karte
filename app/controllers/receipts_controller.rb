class ReceiptsController < ApplicationController
  # 会計一覧
  def index
  	@receipts = Receipt.order(payday: :desc)
  		.reverse_order.page(params[:page]).per(10)
  end

  # 会計詳細
  def show
  	@receipt = Receipt.find(params[:id])
  end

  # 会計登録フォーム
  def new
  	@receipt = Receipt.new
  end

  # 編集フォーム
  def edit
  	@receipt = Receipt.find(params[:id])
  end

  # 会計作成フォーム
  def create
  	@receipt = Receipt.new(receipt_params)
  	if @receipt.save
  		redirect_to @receipt, notice: "お支払いが完了しました"
  	else
  		render "new"
  	end
  end

  # 更新
  def update
  	@receipt = Receipt.find(params[:id])
  	@receipt.assign_attributes(receipt_params)
  	if @receipt.save
  		redirect_to @receipt, notice: "お会計情報を変更しました"
  	else
  		render "edit"
  	end
  end

  # 削除
  def destroy
  	@receipt = Receipt.find(params[:id])
  	@receipt.destroy
  	redirect_to @receipts
  end

  private
  def receipt_params
  	params.require(:receipt).permit(:payday, :payment_method, :service, :payment, :gained_point)
  end

end
