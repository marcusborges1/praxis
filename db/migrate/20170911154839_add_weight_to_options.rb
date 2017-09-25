class AddWeightToOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :options, :weight, :float
  end
end
