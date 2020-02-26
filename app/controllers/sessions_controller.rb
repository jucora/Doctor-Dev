class SessionsController < ApplicationController
  before_action :session?, only: [:new]
  def new; end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user &.authenticate(params[:session][:password])
      sign_in(@user)
      redirect_to @user
      flash[:danger] = "Welcome #{@user.name}"
    else
      flash[:danger] = 'Wrong user or password'
      render :new
    end
  end

  def delete
    @current_user = nil
    cookies.delete(:remember_token)
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end
  
  def session?
    if current_user.present?
      redirect_to current_user
    end
  end
end
