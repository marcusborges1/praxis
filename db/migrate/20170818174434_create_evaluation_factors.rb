class CreateEvaluationFactors < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluation_factors do |t|
      t.string :name

      t.timestamps
    end
  end
end
