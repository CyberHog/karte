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
  	@clinic = Clinic.find(params[:id])
  end

  # 新規作成フォーム
  def new
    @clinic = Clinic.new
  end

  # 新規作成
  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.owner = current_user
    if @clinic.save
      redirect_to @clinic, notice: "クリニックを登録しました"
    else
      render "new"
    end
  end

  # 編集
  def edit
  	@clinic = current_user.clinic
  end

  # 更新
  def update
  	@clinic = current_user.clinic
  	@clinic.assign_attributes(clinic_params)
  	if @clinic.save
  	  redirect_to @clinic, notice: "クリニックの情報を更新しました"
  	else
      render "edit"
    end
  end

  # 削除
  def destroy
  	@clinic = current_user.clinic.find(params[:id])
  	@clinic.destroy
  	redirect_to :clinics, notice: "クリニックを削除しました"
  end

  private
  def clinic_params
    params.require(:clinic).permit(:id, :user_id, :name, :hp_url)
  end
end
