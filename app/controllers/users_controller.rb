# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logout_required, only: [:new, :create]
  before_action :login_required, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:mypage, :verify, :edit, :update]
  before_action :should_verify_user, only: [:mypage, :edit, :update]
  before_action :only_current_user, only: [:mypage, :edit, :update]
  before_action :current_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    Thread.current[:base_url] = request.base_url
    @user = User.new(create_user_params)

    if @user.save
      flash[:success] = flash[:success] = "まだ登録は完了してません！お送りしたメールアドレス確認用メールから登録を完了させてください。"
      render(:unverified)
    else
      flash[:error] = "アカウントの登録に失敗しました。再度お試しください。"
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id], status: :verified)
    unless @user
      flash[:error] = "このアカウントは表示できません。"
      redirect_to root_path and return
    end

    if @current_user && @current_user == @user
      redirect_to mypage_user_path(@user) and return
    end

    @posts = @user.valid_posts.page(params[:page]).per(20)
  end

  # GET /users/:id/mypage
  def mypage
    @posts = @user.valid_posts.page(params[:page]).per(20)
  end

  def edit; end

  def update
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
    if @user.verify_by(verify_params[:vt])
      login_and_remember(@user)
      flash[:success] = "メールアドレスの確認が完了しました。プロフィールを編集してください！"
      redirect_to mypage_user_path(@user)
    else
      flash[:error] = "このアカウントの認証に失敗しました。再度確認メールに送られたURLを表示ください。"
      redirect_to root_path
    end
  end

  private

    def set_user
      @user = User.find(params[:id])

      unless @user
        flash[:error] = "このページは存在しません"
        redirect_to root_path and return
      end
    end

    def should_verify_user
      unless @user.status_verified?
        render(:unverified) and return
      end
    end

    def only_current_user
      unless current_user == @user
        flash[:error] = "このページは表示できません"
        redirect_to mypage_user_path(current_user) and return
      end
    end

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
