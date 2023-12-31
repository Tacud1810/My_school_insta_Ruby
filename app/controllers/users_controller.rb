class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to posts_path, notice: "Welcome #{@user.username}" }
        format.json { render :show, status: :created, location: posts_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
		
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

end