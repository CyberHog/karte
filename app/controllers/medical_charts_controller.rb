 class MedicalChartsController < ApplicationController
  # 記事一覧
  def index
    @user = current_user
  	@medical_charts = @user.received_charts
    @medical_charts = MedicalChart.order(visited_at: :desc)
      .reverse_order.page(params[:page]).per(10)
  end

  # カルテ詳細
  def show
    @user = current_user
  	@medical_chart = MedicalChart.find(params[:id])
  end

  def br(str) 
    html_escape(str).gsub(/\r\n|\r|\n/, "<br />").html_safe 
  end

end
