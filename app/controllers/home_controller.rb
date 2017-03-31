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
		puts question.id
		question_follower=QuestionFollowersMapping.new
		question_follower.question_id=question.id
		question_follower.user_id=session[:user_id]
		question_follower.save
		redirect_to '/'
	end

	def questions_asked
		@questions=Question.all
	end

	def follow
	end

	def find_people
		@people_ids=User.all.pluck(:id)
	end

end
