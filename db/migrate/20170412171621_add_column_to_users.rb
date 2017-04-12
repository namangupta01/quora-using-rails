class AddColumnToUsers < ActiveRecord::Migration
	def change
		add_column :users,:profile_picture_name,:string
	end
end
