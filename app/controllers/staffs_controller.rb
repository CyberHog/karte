class StaffsController < ApplicationController
  # スタッフ一覧
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @staffs = @user.staffs
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
