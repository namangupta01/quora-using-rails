class AuthenticationSystemController < ApplicationController

	def signin_get		
	end

	def sign_in
		name=params[:name]
		password=params[:password]
		email=params[:email]
		user=User.new
		user.name=name
		user.email=email
		user.password=password
		user.save
		session[:user_id]=user.id
		byebug
		redirect_to '/'
	end

	
end
