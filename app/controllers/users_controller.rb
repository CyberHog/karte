class UsersController < ApplicationController
  before_action :sign_in_required

  # 会員一覧
  def index
    @users = User.order(current_user.id)
      .page(params[:page]).per(10)
  end

  # 会員情報の詳細
  def show
    @user = User.find(params[:id])
  end

  # 検索
  def search
    @users = User.search(params[:q])
      .page(params[:page]).per(10)
    render "index"
  end

  # 編集
  def edit
    @user = User.find(params[:id])
  end

  # 更新
  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_update_params)
    if @user.save
      redirect_to @user, notice: "会員情報を更新しました"
    else
      render "edit"
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  # 会員の削除
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :users, notice: "会員を削除しました。"
  end

  private
  def user_update_params
    attrs = [:practice, :last_name, :first_name, :email, :phone, :birthday, :gender, :password,
      :password_confirmation, :avatar, :avatar_cache, :remove_avatar,
       address_attributes: [ :id, :postcode, :prefecture, :city, :street, :building ]]
    params.require(:user).permit(attrs)
  end

end
