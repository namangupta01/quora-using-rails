class Question < ActiveRecord::Base
	belongs_to	:user
	has_many	:question_followers_mappings
	has_many 	:answers
	has_many	:question_upvotes
	has_many	:question_downvotes
end
