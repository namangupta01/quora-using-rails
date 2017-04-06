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
		follow_mapping=FollowMapping.new
		follow_mapping.follower_id=session[:user_id]
		follow_mapping.followee_id=params[:id].to_i
		follow_mapping.save
		redirect_to '/find_people'
	end

	def unfollow
		id=params[:id]
		remove_follow_mapping = FollowMapping.where(follower_id: session[:user_id],followee_id: id).first
		remove_follow_mapping.destroy
		redirect_to '/find_people'
	end
	def find_people
		@people_ids=User.all.pluck(:id)
		@people_ids.delete(session[:user_id])
	end

	def all_questions
		@questions=Question.all
	end


	def follow_question
		id=params[:id].to_i
		question_new_follower=QuestionFollowersMapping.create(question_id: id,user_id: session[:user_id])
		question_new_follower.save
		redirect_to '/all_questions'
	end

	def unfollow_question
		id=params[:id].to_i
		question_destroy_followers=QuestionFollowersMapping.find_by(question_id: id, user_id:session[:user_id])
		question_destroy_followers.destroy
		redirect_to '/all_questions'

	end

	def search
		search=params[:search]
		query="questions like '%#{search}%'"
		@questions=Question.where(query)
	end

	def top_stories
		
	end
end
