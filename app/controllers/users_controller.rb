class UsersController < ApplicationController
  before_action :sign_in_required

  # 会員一覧
  def index
    @users = User.order("user_id")
      .page(params[:page]).per(10)
  end

  # 会員情報の詳細
  def show
    @user = User.find(params[:id])
    if params[:format].in?(["jpg", "png", "gif"])
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

  private
  # 画像送信
  def send_image
    if @user.image.present?
      send_data @user.image.data,
      type: @user.image.content_type, disposition: "inline"
    else
      raise NotFound
    end
  end
end
