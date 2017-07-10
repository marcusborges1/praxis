class AddNameToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :name, :string
  end
end
