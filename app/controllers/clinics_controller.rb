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

  # 新規作成フォーム
  def new
    @user = User.find(params[:user_id])
    @clinic = Clinic.new
  end

  # 新規作成
  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.owner = current_user
    if @clinic.save
      redirect_to user_clinic_url(id: @clinic.id), notice: "クリニックを登録しました"
    else
      render "new"
    end
  end

  # 編集
  def edit
    @user = User.find(params[:user_id])
  	@clinic = current_user.clinic
  end

  # 更新
  def update
  	@clinic = current_user.clinic
  	@clinic.assign_attributes(clinic_params)
  	if @clinic.save
  	  redirect_to user_clinic_url(id: @clinic.user_id), notice: "クリニックの情報を更新しました"
  	else
      render "edit"
    end
  end

  # 削除
  def destroy
  	@clinic = current_user.clinic
  	@clinic.destroy
  	redirect_to current_user, notice: "クリニックを削除しました"
  end

  private
  def clinic_params
    params.require(:clinic).permit(:id, :user_id, :name, :hp_url)
  end
end
