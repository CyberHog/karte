class ClinicsController < ApplicationController
  # 一覧
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @clinics = @user.clinic
    else
      @clinics = Clinic.all
    end
    @clinics = Clinic.order(:name).page(params[:page]).per(10)
  end

  # 詳細
  def show
    @user = User.find(params[:user_id])
  	@clinic = @user.clinic
  end

end
