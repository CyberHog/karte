class MenusController < ApplicationController
  # メニュー一覧
  def index
  	@menus = Menu.order("content_id")
  end

  # 検索
  def search
  	@menus = Menu.search(params[:q])
  	render "index"
  end

  # メニュー詳細
  def show
  	@menu = Menu.find(params[:id])
  end

  # 新規作成フォーム
  def new
 	  @menu = Menu.new
  end

  # 更新フォーム
  def edit
 	  @menu = Menu.find(params[:id])
  end

  # メニュー新規登録
  def create
 	  @menu = Menu.new(menu_params)
 	  if @menu.save
 	    redirect_to @menu, notice: "メニューを登録しました"
 	  else
 	    render "new"
 	  end
  end

  # メニュー情報の更新
  def update
  	@menu = Menu.find(params[:id])
  	@menu.assign_attributes(menu_params)
  	if @menu.save
  	  redirect_to @menu, notice: "メニューを更新しました"
  	else
  	  render "edit"
  	end
  end

  # メニューの削除
  def destroy
  	@menu = Menu.find(params[:id])
  	@menu.destroy
  	redirect_to :menus, notice: "メニューを削除しました"
  end

  private
  def menu_params
    params.require(:menu).permit(:content_id, :content_name, :price, :attached_point)
  end
end
