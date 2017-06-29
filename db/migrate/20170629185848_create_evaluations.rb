class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.date :start_date
      t.date :finish_date
      t.references :evaluation_model, foreign_key: true

      t.timestamps
    end
  end
end
