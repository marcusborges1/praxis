class RemoveEvaluationFactorFromEvaluationFactor < ActiveRecord::Migration[5.0]
  def change
    remove_reference :evaluation_factors, :evaluation_factor, foreign_key: true
  end
end
