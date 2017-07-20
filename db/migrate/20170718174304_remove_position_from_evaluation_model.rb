class RemovePositionFromEvaluationModel < ActiveRecord::Migration[5.0]
  def change
    remove_reference :evaluation_models, :position, foreign_key: true
  end
end
