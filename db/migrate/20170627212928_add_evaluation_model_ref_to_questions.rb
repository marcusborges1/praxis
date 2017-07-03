class AddEvaluationModelRefToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :evaluation_model, foreign_key: true
  end
end
