class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(name: params[:session][:name])
  	if(@user &.authenticate(params[:session][:password]))
			sign_in(@user)
			redirect_to @user
			flash[:danger] = "Welcome #{@user.name}" 
		else
			flash[:danger] = "Wrong user or password"
			render :new
		end
	end

	def destroy
	end

	private
	def session_params
		params.require(:session).permit(:name, :password)
	end
end
