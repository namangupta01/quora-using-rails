class CreateQuestionFollowersMappings < ActiveRecord::Migration
  def change
    create_table :question_followers_mappings do |t|
    	t.references :question,index:true,foreign_key:true
    	t.references :user,index:true,foreign_key:true
    	t.timestamps null: false
    end
  end
end
