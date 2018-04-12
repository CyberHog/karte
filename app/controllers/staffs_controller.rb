class StaffsController < ApplicationController
  # スタッフ一覧
  def index
  	@staffs = Staff.order("staff_number")
  end

  # 検索
  def search
  	@staffs = Staff.search(params[:q])
  	render "index"
  end

  # 新規作成フォーム
  def new
  	@staff = Staff.new
  end

  # 更新フォーム
  def edit
  	@staff = Staff.find(params[:id])
  end

  # スタッフ新規登録
  def create
  	@staff = Staff.new(staff_params)
  	if @staff.save
  		redirect_to :staffs, notice: "スタッフを登録しました"
  	else
  		render "new"
  	end
  end

  # スタッフ情報の更新
  def update
  	@staff = Staff.find(params[:id])
  	@staff.assign_attributes(staff_params)
  	if @staff.save
  		redirect_to :staffs, notice: "スタッフを更新しました"
  	else
  		render "edit"
  	end
  end

  # スタッフ削除
  def destroy
  	@staff = Staff.find(params[:id])
  	@staff.destroy
  	redirect_to :staffs, notice: "スタッフを削除しました"
  end

  private
  def staff_params
  	params.require(:staff).permit(:staff_number, :staff_name, :staff_suspension)
  end
end
