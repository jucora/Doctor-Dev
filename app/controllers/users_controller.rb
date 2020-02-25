class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      sign_in(@user)
      redirect_to @user
      flash[:notice] = "Welcome #{@user.name}"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def logged_in?
    return unless current_user.nil?

    redirect_to root_path
    flash[:alert] = 'Please sign in first'
  end
end
