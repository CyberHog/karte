class NoticesController < ApplicationController
  before_action :sign_in_required, exept: [:index, :show]

  # 記事一覧
  def index
  	@users = current_user.all_following
    puts "debug----"
    puts @users
    puts "debug/---"
    @notices = @users.notices
  	@notices = @notices.readable_for(current_user)
  	.order(released_at: :desc).page(params[:page]).per(10)
  end

  #  記事詳細
  def show
  	@notice = Notice.readable_for(current_user).find(params[:id])
  end

end
