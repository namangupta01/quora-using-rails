class CreateQuestionUpvotes < ActiveRecord::Migration
  def change
    create_table :question_upvotes do |t|

		t.references :user,index:true,foreign_key:true
    	t.timestamps null: false
    end
  end
end
