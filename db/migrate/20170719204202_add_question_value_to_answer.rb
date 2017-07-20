class AddQuestionValueToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :question_value, foreign_key: true
  end
end
