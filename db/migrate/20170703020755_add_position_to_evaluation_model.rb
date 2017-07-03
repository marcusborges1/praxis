class AddPositionToEvaluationModel < ActiveRecord::Migration[5.0]
  def change
    add_reference :evaluation_models, :position, foreign_key: true
  end
end
