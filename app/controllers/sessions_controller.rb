class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.where(:email => params[:email]).first
		if user && user.password == params[:password]
			session[:user_id] = user.id
			flash[:notice] = "Welcome Back!"
			return redirect_to '/boards'
		end
		flash[:alert] = "Login Failed"
		redirect_to '/login'
	end
	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged Out Successfully"
		return redirect_to '/login'
	end
end