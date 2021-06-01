# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :logout_required, only: [:create]
  def new; end

  def create
    user = User.find_by(email: login_params[:email])
    if user&.authenticate(login_params[:password])
      login_and_remember(user)
      flash[:success] = "ログインしました。"
      redirect_to user_path(user)
    else
      flash[:error] = "メールアドレスかパスワードが間違っています。"
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = "ログアウトしました。"
    redirect_to login_path
  end

  private
    def login_params
      params.require(:session).permit(:email, :password)
    end
end
