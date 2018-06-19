class ClinicCardsController < ApplicationController
  # 一覧
  def index
    @user = current_user
    @clinic_cards = @user.published_cards
    @clinic_cards = ClinicCard.order(:id).reverse_order.page(params[:page]).per(10)
  end

  # 詳細
  def show
    @user = current_user
    @clinic_card = ClinicCard.find(params[:id])
    if PatientsReceipt.where(clinic_card_id: @clinic_card.id).present?
      card_receipts = PatientsReceipt.where(clinic_card_id: @clinic_card.id).order(:payday)
      @payday = card_receipts.last.payday
    end
  end

end
