class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			redirect_to user, notice: "Welcome #{user.username}, you are succesfully loged in"
		else
			flash.now[:alert] = "Something is wrong with your login informations"
			render :new, status: :unprocessable_entity
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: "Succesfully loged out"
	end


end