class AddUserToAnswerGroups < ActiveRecord::Migration[5.0]
  def change
    add_reference :answer_groups, :user, foreign_key: true
  end
end
