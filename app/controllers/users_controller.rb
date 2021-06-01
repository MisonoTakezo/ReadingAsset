# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logout_required, only: [:new, :create]
  before_action :login_required, only: [:edit, :update]
  before_action :current_user, only: [:show, :mypage]

  def new
    @user = User.new
  end

  def create
    Thread.current[:base_url] = request.base_url
    @user = User.new(create_user_params)

    unless @user.save
      render :new
      flash[:error] = "アカウントの登録に失敗しました。"
    end
  end

  def show
    @user = User.find_by(id: params[:id], status: :verified)
    if @user == @current_user
      redirect_to mypage_user_path(@user) && return
    end
    @posts = @user.posts.order(updated_at: :desc)
  end

  def mypage
    @user = User.find_by(id: params[:id], status: :verified)
    unless @user == @current_user
      redirect_to user_path(@user) && return
    end
    @posts = @current_user.posts.order(updated_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(update_user_params)
      flash[:success] = "アカウント情報を更新しました。"
      redirect_to edit_user_path(@user)
    else
      render :edit
      flash[:error] = "アカウント情報の更新に失敗しました。"
    end
  end

  # GET /users/:id/verify
  def verify
    user = User.find(verify_params[:id])
    puts user.status
    if user.verification_token == verify_params[:vt]
      if user.update!(status: :verified)
        flash[:success] = "更新しました。"
        login_and_remember(user)
        flash[:success] = "メールアドレスの確認が完了しました。プロフィールを編集してください！"
        redirect_to root_path
      else
        flash[:error] = "更新に失敗しました。"
        redirect_to root_path
      end
    else
      flash[:error] = "このアカウントの認証に失敗しました。再度確認メールに送られたURLを表示ください。"
      redirect_to("/") && (return)
    end
  end

  private
    def create_user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def update_user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def verify_params
      params.permit(
        :id,
        :vt,
      )
    end
end
