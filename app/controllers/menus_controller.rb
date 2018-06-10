class MenusController < ApplicationController
  # メニュー一覧
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @menus = @user.menus
    else
      @menus = Menu.all
    end
  	@menus = Menu.order("content_id")
  end

  # 検索
  def search
  	@menus = Menu.search(params[:q])
  	render "index"
  end

  # メニュー詳細
  def show
    @user = User.find(params[:user_id])
  	@menu = Menu.find(params[:id])
  end

end
