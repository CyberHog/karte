class Practice::UsersController < Practice::Base
  before_action :sign_in_required

  # 会員一覧
  def index
    @users = current_user.all_following
  end

  # 会員情報の詳細
  def show
    @user = User.find(params[:id])
    @clinic_card = ClinicCard.find_by(publisher_id: current_user.id, holder_id: @user.id)
    if @clinic_card.present?
      if PatientsReceipt.where(clinic_card_id: @clinic_card.id).present?
        card_receipts = PatientsReceipt.where(clinic_card_id: @clinic_card.id, seller_id: current_user.id).order(:payday)
        @payday = card_receipts.last.payday
      end
    end
    @follow_count = current_user.follow_count
    @followers_count = current_user.followers_count
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

  # フォローしている人のリストを表示
  def following
    @user = User.find(params[:user_id])
    @users = @user.all_following
    render 'users/show_follow'
  end

  # フォロワーのリストを表示
  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
    render 'users/show_follower'
  end

  # フォローする
  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to practice_user_path(@user)
  end

  # フォロー解除
  def unfollow
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
    redirect_to practice_user_path(@user)
  end

  # 会員の削除
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to practice_users_path(@user), notice: "会員を削除しました。"
  end

  private
  def user_update_params
    attrs = [:practice, :last_name, :first_name, :email, :phone, :birthday, :gender, :password,
      :password_confirmation, :avatar, :avatar_cache, :remove_avatar,
       address_attributes: [ :id, :postcode, :prefecture, :city, :street, :building ]]
    params.require(:user).permit(attrs)
  end

end
