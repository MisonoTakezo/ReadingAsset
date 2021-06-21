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

    if @user.save
      flash[:success] = flash[:success] = "まだ登録は完了してません！お送りしたメールアドレス確認用メールから登録を完了させてください。"
      redirect_to root_path
    else
      render :new
      flash[:error] = "アカウントの登録に失敗しました。"
    end
  end

  def show
    @user = User.find_by(id: params[:id], status: :verified)

    if @current_user && @current_user == @user
      redirect_to mypage_user_path(@user) and return
    end

    @posts = @user.valid_posts.page(params[:page]).per(20)
  end

  # GET /users/:id/mypage
  def mypage
    @user = User.find_by(id: params[:id], status: :verified)

    unless  @current_user && @current_user == @user
      redirect_to user_path(@user) and return
    end

    @posts = @user.valid_posts.page(params[:page]).per(20)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(update_user_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to mypage_user_path(@user)
    else
      render :edit
      flash[:error] = "プロフィールの更新に失敗しました。"
    end
  end

  # GET /users/:id/verify
  def verify
    user = User.find(verify_params[:id])
    if user.verify_by(verify_params[:vt])
      login_and_remember(user)
      flash[:success] = "メールアドレスの確認が完了しました。プロフィールを編集してください！"
      redirect_to mypage_user_path(user)
    else
        flash[:error] = "このアカウントの認証に失敗しました。再度確認メールに送られたURLを表示ください。"
        redirect_to root_path
    end
  end

  private
    def create_user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def update_user_params
      params.require(:user).permit(:name, :bio, :profile_image)
    end

    def verify_params
      params.permit(
        :id,
        :vt,
      )
    end
end
