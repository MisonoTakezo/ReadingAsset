class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: "アカウント登録が完了しました。"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: "アカウント情報を更新しました。"
    else
      render :edit
    end
  end


  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to new_user_path, notice: "アカウントを削除しました。"
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
