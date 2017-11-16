class AddContextToEvaluationModel < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluation_models, :context, :integer, default: 0
  end
end
