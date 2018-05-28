class MedicalChartsController < ApplicationController
  # 記事一覧
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
  	  @medical_charts = @user.received_charts
    else
      @medical_charts = MedicalChart.all
    end
    @medical_charts = MedicalChart.order(visited_at: :desc)
      .reverse_order.page(params[:page]).per(10)
  end

  # カルテ詳細
  def show
    @user = User.find(params[:user_id])
  	@medical_chart = MedicalChart.find(params[:id])
  end

  # 新規登録フォーム
  def new
    @staff_name = Staff.where(user_id: current_user.id, staff_suspension: false).pluck(:staff_name)
    @user = User.find(params[:user_id])
  	@medical_chart = MedicalChart.new(visited_at: Time.current)
    @medical_chart.user_id = @user.id
  end

  # 新規作成フォーム
  def create
    @user = User.find(params[:user_id])
  	@medical_chart = MedicalChart.new(medical_chart_params)
    @medical_chart.patient = @user
  	if @medical_chart.save
  		redirect_to user_medical_chart_url(id: @medical_chart.id), notice: "カルテを登録しました"
  	else
  		render "new"
  	end
  end

  # 編集フォーム
  def edit
    @staff_name = Staff.where(user_id: current_user.id, staff_suspension: false).pluck(:staff_name)
    @user = User.find(params[:user_id])
    @medical_chart = MedicalChart.find(params[:id])
  end

  # 更新
  def update
  	@medical_chart = MedicalChart.find(params[:id])
  	@medical_chart.assign_attributes(medical_chart_params)
  	if @medical_chart.save
  		redirect_to user_medical_charts_url(id: @medical_chart.id), notice: "カルテを更新しました"
  	else
  		render "edit"
  	end
  end

  # 削除
  def destroy
  	@medical_chart = MedicalChart.find(params[:id])
  	@medical_chart.destroy
  	redirect_to user_medical_charts_url(id: @medical_chart.id), notice: "カルテを削除しました"
  end

  def br(str) 
    html_escape(str).gsub(/\r\n|\r|\n/, "<br />").html_safe 
  end

  private
  def medical_chart_params
    params.require(:medical_chart).permit(:id, :user_id, :therapist_id, :patient_id, :card_number, :visited_at, :service, :staff_name, :cc, :tx_comment, :comment)
  end
end
