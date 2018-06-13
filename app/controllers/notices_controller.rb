class NoticesController < ApplicationController
  before_action :sign_in_required, exept: [:index, :show]

  # 記事一覧
  def index
    @users = current_user.all_following
    user_ids = []
    @users.each do |user|
      user_ids.push(user.id)
    end
    @notices = Notice.all.order(released_at: :desc).page(params[:page]).per(10)
    @notices = @notices.where(user_id: user_ids)
  end

  #  記事詳細
  def show
    
  	@notice = Notice.find(params[:id])
  end

end
