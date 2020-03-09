class ApplicationController < ActionController::Base
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token]) if cookies[:remember_token]
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
    redirect_to new_session_path
  end

  def logged_in?
    return if current_user.present?

    redirect_to root_path
    flash[:alert] = 'Please sign in first!'
  end

  def destroy_transaction
    cookies.delete(:transaction_type) if cookies[:transaction_type]
  end

  helper_method :current_user, :logged_in?
end
