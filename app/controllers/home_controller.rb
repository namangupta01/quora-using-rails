class HomeController < ApplicationController
	before_action :authenticate_user
	def index
		puts "as"
	end
end
