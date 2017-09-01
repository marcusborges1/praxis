class AddQuestionToEvaluationFactor < ActiveRecord::Migration[5.0]
  def change
    add_reference :evaluation_factors, :question, foreign_key: true
  end
end
