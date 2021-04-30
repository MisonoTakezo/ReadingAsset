class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    puts user.authenticate(session_params[:password])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: 'ログインしました。'
    else
      redirect_to login_path, notice: 'ログインできませんでした。'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
