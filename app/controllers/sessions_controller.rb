class SessionsController < ApplicationController
	def new
		@show_sidebar=false
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or sw_interactions_path 
		else
			@show_sidebar=false
			flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to signin_path 
	end

end
