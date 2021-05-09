class UsersController < ApplicationController
  def new
    @user = User.new
    render layout: "session"
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "アカウント登録が完了しました。"
      redirect_to login_path
    else
      render :new
      flash[:error] = "アカウントの登録に失敗しました。"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "アカウント情報を更新しました。"
      redirect_to edit_user_path(@user)
    else
      render :edit
      flash[:error] = "アカウント情報の更新に失敗しました。"
    end
  end


  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to new_user_path, notice: "アカウントを削除しました。"
    else
      flash[:error] = "アカウントの削除に失敗しました。"
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
