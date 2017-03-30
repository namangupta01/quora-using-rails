class CreateAnswerDownvotes < ActiveRecord::Migration
  def change
    create_table :answer_downvotes do |t|

      t.timestamps null: false
    end
  end
end
