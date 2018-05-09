class ClinicCardsController < ApplicationController
  # 一覧
  def index
    if params[:holder_id]
      @user = User.find(params[:holder_id])
      @clinic_cards = @user.clinic_cards
    else
      @clinic_cards = ClinicCard.all
    end
    @clinic_cards = ClinicCard.joins(:patients_receipt).includes(:patients_receipt).order("patients_receipt.payday").reverse_order
  end

  # 詳細
  def show
 	  @clinic_card = ClinicCard.find(params[:id])
  end

  # 登録
  def new
  	@clinic_card = ClinicCard.new
  end

  # 作成
  def create
  	@clinic_card = ClinicCard.new(clinic_card_params)
    @clinic_card.holder = @user
  	if @clinic_card.save
  	  redirect_to @clinic_card, notice: "診察券を作成しました"
  	else
  	  render "new"
  	end
  end

  # 編集
  def edit
  	@clinic_card = holder.clinic_card
  end

  # 更新
  def  update
  	@clinic_card = holder.clinic_cards.find(params[:id])
  	@clinic_card.assign_attributes(clinic_card_params)
  	if @clinic_card.save
  		redirect_to @clinic_card, notice: "診察券を更新しました"
  	else
  		render "edit"
  	end
  end

  # 削除
  def destroy
  	@clinic_card = holder.clinic_cards.find(params[:id])
  	@clinic_card.destroy
  	redirect_to :clinic_cards, notice: "診察券を削除しました"
  end

  private
  def clinic_card_params
  	params.require(:clinic_card).permit(:id , :user_id, :publisher_id, :holder_id, :number, :holding_point)
  end
end
