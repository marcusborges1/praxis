class CreateEvaluationCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluation_cycles do |t|
      t.datetime :initial_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
