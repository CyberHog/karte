class ClinicCardsController < ApplicationController
  # 一覧
  def index
    @clinic_cards = ClinicCard.find(params[:id])
  end

  # 詳細
  def show
 	  @clinic_card = CLinicCard.find(params[:id])
  end

  # 登録
  def new
    @user = User.find(params[:patient_id])
  	@clinic_card = ClinicCard.new
  end

  # 作成
  def create
  	@clinic_card = ClinicCard.new(clinic_card_params)
  	if @clinic_card.save
  	  redirect_to user_path(@user), notice: "診察券を作成しました"
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
  		redirect_to @user, notice: "診察券を更新しました"
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
  	params.require(:clinic_card).permit(:id , :clinic_id, :patient_id, :number)
  end
end
