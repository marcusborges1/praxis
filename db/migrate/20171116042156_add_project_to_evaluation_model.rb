class AddProjectToEvaluationModel < ActiveRecord::Migration[5.0]
  def change
    add_reference :evaluation_models, :project, foreign_key: true
  end
end
