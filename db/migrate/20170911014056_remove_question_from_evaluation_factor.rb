class RemoveQuestionFromEvaluationFactor < ActiveRecord::Migration[5.0]
  def change
    remove_reference :evaluation_factors, :question, foreign_key: true
  end
end
