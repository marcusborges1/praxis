class RemoveEvaluationModelFromQuestion < ActiveRecord::Migration[5.0]
  def change
    remove_reference :questions, :evaluation_model, foreign_key: true
  end
end
