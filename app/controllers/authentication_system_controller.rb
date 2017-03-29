class AuthenticationSystemController < ApplicationController
	before_action :authenticate_user
	
end
