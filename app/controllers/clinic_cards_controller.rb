class ClinicCardsController < ApplicationController
  # 一覧
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @clinic_cards = @user.held_cards
    else
      @clinic_cards = ClinicCard.all
    end
    @clinic_cards = ClinicCard.joins(:patients_receipt).includes(:patients_receipt).order("patients_receipt.payday").reverse_order
  end

  # 詳細
  def show
    @user = User.find(params[:user_id])
    @publisher = @user.clinic
    @clinic_card = @user.held_cards
  end

  # 登録
  def new
    @user = User.find(params[:user_id])
  	@clinic_card = ClinicCard.new
    @clinic_card.user_id = @user.id
    @cardid = ClinicCard.count + 1
  end

  # 作成
  def create
    @user = User.find(params[:user_id])
  	@clinic_card = ClinicCard.new(clinic_card_params)
    @clinic_card.holder = @user
  	if @clinic_card.save
  	  redirect_to user_clinic_card_url(id: @clinic_card.id), notice: "診察券を作成しました"
  	else
  	  render "new"
  	end
  end

  # 編集
  def edit
    @user = User.find(params[:user_id])
  	@clinic_card = holder.clinic_card
  end

  # 更新
  def  update
  	@clinic_card = holder.clinic_card
  	@clinic_card.assign_attributes(clinic_card_params)
  	if @clinic_card.save
  		redirect_to user_clinic_cards_url(id: @clinic_card.user_id), notice: "診察券を更新しました"
  	else
  		render "edit"
  	end
  end

  # 削除
  def destroy
  	@clinic_card = holder.clinic_card
  	@clinic_card.destroy
  	redirect_to :clinic_cards, notice: "診察券を削除しました"
  end

  private
  def clinic_card_params
  	params.require(:clinic_card).permit(:id , :user_id, :publisher_id, :holder_id, :number, :holding_point)
  end
end
