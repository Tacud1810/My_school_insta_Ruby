class UsersController < ApplicationController

	def index
		@users = User.all
	end

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

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "#{@user.username} update successfull" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end


	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

end