class CreateEvaluationModels < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluation_models do |t|
      t.string :name

      t.timestamps
    end
  end
end
