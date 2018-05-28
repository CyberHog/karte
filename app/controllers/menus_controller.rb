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

  # 新規作成フォーム
  def new
    @user = User.find(params[:user_id])
 	  @menu = Menu.new
  end

  # メニュー新規登録
  def create
 	  @menu = Menu.new(menu_params)
    @menu.owner = current_user
 	  if @menu.save
 	    redirect_to user_menu_url(id: @menu.id), notice: "メニューを登録しました"
 	  else
 	    render "new"
 	  end
  end

  # 更新フォーム
  def edit
    @user = User.find(params[:user_id])
    @menu = Menu.find(params[:id])
  end

  # メニュー情報の更新
  def update
  	@menu = Menu.find(params[:id])
  	@menu.assign_attributes(menu_params)
  	if @menu.save
  	  redirect_to user_menus_url(id: @menu.id), notice: "メニューを更新しました"
  	else
  	  render "edit"
  	end
  end

  # メニューの削除
  def destroy
  	@menu = Menu.find(params[:id])
  	@menu.destroy
  	redirect_to user_menus_url(id: @menu.id), notice: "メニューを削除しました"
  end

  private
  def menu_params
    params.require(:menu).permit(:user_id, :content_id, :content_name, :price, :attached_point, :coupon, :count, :validity_period)
  end
end
