class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def user_signed_in?
		!session[:user_id].nil?
	end

	def authenticate_user
		unless !user_signed_in?
			redirect_to '/sign_in'
		end
	end
  
end
