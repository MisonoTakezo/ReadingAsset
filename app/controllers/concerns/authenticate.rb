module Authenticate
  extend ActiveSupport::Concern

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id], status: :verified)
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by(id: user_id, status: :verified)
      if user && user.remember_authenticated?(cookies[:remember_token])
        login(user)
        @current_user = user
      end
    end
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    @current_user = nil
  end

  def login_required
    return redirect_to login_path unless current_user
  end

  def logout_required
    return redirect_to mypage_user_path(@current_user) if current_user
  end

  def login_and_remember(user)
    login(user)
    remember(user)
  end

  def remember(user)
    token = user.user_remembers.create.token
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = token
  end

  # ログイン中？
  def logged_in?
    !current_user.nil?
  end
end
