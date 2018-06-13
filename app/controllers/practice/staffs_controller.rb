class Practice::StaffsController < Practice::Base
  # スタッフ一覧
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @staffs = @user.staffs
    else
      @staffs = Staff.all
    end
  	  @staffs = Staff.order("staff_number")
    end

  # 検索
  def search
    @user = User.find(params[:user_id])
  	@staffs = Staff.search(params[:q])
  	render "index"
  end

  # 新規作成フォーム
  def new
    @user = User.find(params[:user_id])
  	@staff = Staff.new
  end

  # スタッフ新規登録
  def create
  	@staff = Staff.new(staff_params)
    @staff.owner = current_user
  	if @staff.save
  		redirect_to practice_user_staffs_url(id: @staff.id), notice: "スタッフを登録しました"
  	else
  		render "new"
  	end
  end

  # 更新フォーム
  def edit
    @user = User.find(params[:user_id])
    @staff = Staff.find(params[:id])
  end

  # スタッフ情報の更新
  def update
  	@staff = Staff.find(params[:id])
  	@staff.assign_attributes(staff_params)
  	if @staff.save
  		redirect_to practice_user_staffs_url(id: @staff.id), notice: "スタッフを更新しました"
  	else
  		render "edit"
  	end
  end

  # スタッフ削除
  def destroy
  	@staff = Staff.find(params[:id])
  	@staff.destroy
  	redirect_to practice_user_staffs_url(id: @staff.id), notice: "スタッフを削除しました"
  end

  private
  def staff_params
  	params.require(:staff).permit(:user_id, :staff_number, :staff_name, :staff_suspension)
  end
end
