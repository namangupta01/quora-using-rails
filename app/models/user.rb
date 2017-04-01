class User < ActiveRecord::Base

	has_many :questions
	has_many :followers,class_name: 'FollowMapping',foreign_key: :followee_id
	has_many :followees,class_name: 'FollowMapping',foreign_key: :follower_id

end
