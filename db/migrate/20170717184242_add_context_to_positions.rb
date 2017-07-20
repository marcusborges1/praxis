class AddContextToPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :context, :integer, default: 0
  end
end
