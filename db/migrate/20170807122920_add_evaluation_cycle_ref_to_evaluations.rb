class AddEvaluationCycleRefToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_reference :evaluations, :evaluation_cycle, foreign_key: true
  end
end
