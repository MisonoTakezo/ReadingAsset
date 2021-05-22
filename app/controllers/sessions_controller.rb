# frozen_string_literal: true

class SessionsController < ApplicationController
  layout "session"

  def new; end

  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = "ログインしました。"
      redirect_to user_path(user)
    else
      flash[:error] = "ログインできませんでした。"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    flash[:success] = "ログアウトしました。"
    redirect_to login_path
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
