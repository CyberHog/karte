class UsersController < ApplicationController
  before_action :sign_in_required

  # 会員一覧
  def index
    @users = User.order("user_name")
      .page(params[:page]).per(10)
  end

  # 会員情報の詳細
  def show
    @user = User.find(current_user.id)
    if params[:format].in?(["jpg", "jpeg", "png", "gif"])
      send_image
    else
      render "show"
    end
  end

  # 検索
  def search
    @users = User.search(params[:q])
      .page(params[:page]).per(10)
    render "index"
  end

end
