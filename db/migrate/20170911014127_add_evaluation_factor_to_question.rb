class AddEvaluationFactorToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :evaluation_factor, foreign_key: true
  end
end
