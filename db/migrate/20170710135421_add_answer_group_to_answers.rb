class AddAnswerGroupToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :answer_group, foreign_key: true
  end
end
