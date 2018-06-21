class StaffsController < ApplicationController
  # スタッフ一覧
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @staffs = Staff.where(user_id: @user.id, staff_suspension: false)
      puts "debug------"
      puts @user.last_name
      puts @staffs
      puts "debug/------"
    else
      @staffs = Staff.all
    end
  	@staffs = Staff.order("staff_number")
  end

  # 検索
  def search
    @user = User.find(params[:user_id])
  	@staffs = Staff.search(params[:q])
  	render "index"
  end
  
end
