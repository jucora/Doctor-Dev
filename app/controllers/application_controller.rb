class ApplicationController < ActionController::Base
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    @current_user ||= User.find_by_remember_token!(cookies[:remember_token]) if cookies[:remember_token]
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
    redirect_to new_session_path
  end

  def logged_in?
    redirect_to current_user if user_signed_in?
  end

  helper_method :current_user
end
