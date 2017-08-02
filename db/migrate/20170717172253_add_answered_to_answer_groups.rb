class AddAnsweredToAnswerGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :answer_groups, :answered, :boolean, default: false
  end
end
