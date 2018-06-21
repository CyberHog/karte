class StaffsController < ApplicationController
  # スタッフ一覧
  def index
    @user = User.find(params[:user_id])
    @staffs = Staff.where(user_id: @user.id, staff_suspension: false).order("staff_number")
    puts "debug------"
    puts @user.last_name
    puts @staffs
    puts "debug/------"
  end

  # 検索
  def search
    @user = User.find(params[:user_id])
  	@staffs = Staff.search(params[:q])
  	render "index"
  end
  
end
