class AddSectorToEvaluationModel < ActiveRecord::Migration[5.0]
  def change
    add_reference :evaluation_models, :sector, foreign_key: true
  end
end
