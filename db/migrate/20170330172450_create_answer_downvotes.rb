class CreateAnswerDownvotes < ActiveRecord::Migration
  def change
    create_table :answer_downvotes do |t|
    	t.references :answer,index:true,foreign_key:true
		t.references :user,index:true,foreign_key:true
    	t.timestamps null: false
    end
  end
end
