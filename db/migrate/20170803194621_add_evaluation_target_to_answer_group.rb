class AddEvaluationTargetToAnswerGroup < ActiveRecord::Migration[5.0]
  def change
    add_reference :answer_groups, :evaluation_target, references: :users, index: true
    add_foreign_key :answer_groups, :users, column: :evaluation_target_id
  end
end
