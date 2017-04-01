class AuthenticationSystemController < ApplicationController

	def signin_get		
	end

	def signup_get
	end
	
	def sign_in
		name=params[:name]
		password=params[:password]
		email=params[:email]
		user=User.where(:email=>email).first
		if user
			if user.password==password
				session[:user_id]=user.id
				redirect_to '/'
			else 
				redirect_to'/signin_get'
			end
		else
			redirect_to '/signup_get'
		end
	end

	def sign_up
		name=params[:name]
		password=params[:password]
		email=params[:email]
		puts "i am here"
		user=User.where(email: email).first
		if user
			redirect_to '/signup_get'
		else
			user=User.new
			user.name=name
			user.email=email
			user.password=password
			user.save
			session[:user_id]=user.id
			redirect_to '/'
		end
	end

	
end
