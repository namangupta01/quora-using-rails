class HomeController < ApplicationController
	before_action :authenticate_user
	def index
		@user=User.where(session[:user_id]).first
	end

	def ask_question
		question_content = params[:question]
		question=Question.new
		question.questions=question_content
		question.user_id=session[:user_id]
		question.save
		redirect_to '/'
	end
end
