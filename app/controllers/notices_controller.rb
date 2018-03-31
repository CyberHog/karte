class NoticesController < ApplicationController
  before_action :sign_in_required, exept: [:index, :show]

  # 記事一覧
  def index
  	if params[:user_id]
  	  @user = User.find(params[:user_id])
  	  @notices = @user.notices
  	else
  		@notices = Notice.all
  	end
  	@notices = @notices.readable_for(current_user)
  	.order(released_at: :desc).page(params[:page]).per(10)
  end

  #  記事詳細
  def show
  	@notice = Notice.readable_for(current_user).find(params[:id])
  end

  # 新規陽徳フォーム
  def new
    @notice = Notice.new(expired_at: Time.current)
  end

  # 編集フォーム
  def edit
    @notice = current_user.notices.find(params[:id])
  end

  # 新規作成
  def create
    @notice = Notice.new(notice_params)
    @notice.author = current_user
    if @notice.save
      redirect_to @notice, notice: "お知らせ記事を作成しました"
    else
      render "new"
    end
  end

  # 更新
  def update
    @notice = current_user.notices.find(params[:id])
    @notice.assign_attributes(notice_params)
    if @notice.save
      redirect_to @notice, notice: "お知らせ記事を更新しました"
    end
  end

  # 削除
  def destroy
    @notice =  current_user.notices.find(params[:id])
    @notice.destroy
    redirect_to :notices, notice: "お知らせ記事を削除しました"
  end

  private
  def notice_params
    params.require(:notice).permit(:title, :body, :released_at, :expired_at, :status)
  end
end
