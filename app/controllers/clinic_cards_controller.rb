class ClinicCardsController < ApplicationController
  # 一覧
  def index
  	@user = User.find(params[:id])
  	@clinic_card = ClinicCard.find(params[:id])
  	@card = @user.clinic_card
  	@card_numbers = @card.numbers
  	@clinic_cards = ClinicCard.joins(:card_numbers).includes(:card_numbers).order("card_numbers.number")
  	  .page(params[:page]).per(15)
  end

  # 詳細
  def show
  	@user = User.find(params[:id])
 	@clinic_card = CLinicCard.find(params[:id])
  end

  # 登録
  def new
  	@clinic_card = ClinicCard.new
  	@clinic_card.card_numbers.build
  end

  # 作成
  def create
  	@clinic_card = ClinicCard.new(clinic_card_params)
  	if @clinic_card.save
  	  redirect_to @user, notice: "診察券を作成しました"
  	else
  	  render "new"
  	end
  end

  # 編集
  def edit
  	@clinic_card = ClinicCard.find(params[:id])
  end

  # 更新
  def  update
  	@clinic_card = ClinicCard.find(params[:id])
  	@clinic_card.assign_attributes(clinic_card_params)
  	if @clinic_card.save
  		rediredt_to @user, notice: "診察券を更新しました"
  	else
  		render "users/show"
  	end
  end

  # 削除
  def destroy
  	@clinic_card = ClinicCard.find(params[:id])
  	@clinic_card.destroy
  	redirect_to @user, notice: "診察券を削除しました"
  end

  private
  def clinic_card_params
  	params.require(:clinic_card).permit(:id , :clini_id, :patient_id, card_numbers_attributes: [:id, :clinic_card_id, :number, :_destroy])
  end
end
