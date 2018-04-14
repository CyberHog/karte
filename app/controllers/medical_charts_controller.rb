class MedicalChartsController < ApplicationController
  # 記事一覧
  def index
  	@medical_charts = MedicalChart.order(visited_at: :desc)
  		.reverse_order.page(params[:page]).per(10)
  end

  # カルテ詳細
  def show
  	@medical_chart = MedicalChart.find(params[:id])
  end

  # 新規登録フォーム
  def new
  	@medical_chart = MedicalChart.new
  end

  # 編集フォーム
  def edit
  	@medical_chart = MedicalChart.find(params[:id])
  end

  # 新規作成フォーム
  def create
  	@medical_chart = MedicalChart.new(medical_chart_params)
  	if @medical_chart.save
  		redirect_to @medical_chart, notice: "カルテを登録しました"
  	else
  		render "new"
  	end
  end

  # 更新
  def update
  	@medical_chart = MedicalChart.find(params[:id])
  	@medical_chart.assign_attributes(medical_chart_params)
  	if @medical_chart.save
  		redirect_to @medical_chart, notice: "カルテを更新しました"
  	else
  		render "edit"
  	end
  end

  # 削除
  def destroy
  	@medical_chart = MedicalChart.find(params[:id])
  	@medical_chart.destroy
  	redirect_to @medical_charts
  end

  def br(str) 
    html_escape(str).gsub(/\r\n|\r|\n/, "<br />").html_safe 
  end

  private
  def medical_chart_params
    params.require(:medical_chart).permit(:card_number, :visited_at, :service, :staff_name, :cc, :tx_comment, :comment)
  end
end
