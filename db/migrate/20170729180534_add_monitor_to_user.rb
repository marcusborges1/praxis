class AddMonitorToUser < ActiveRecord::Migration[5.0]
  def change
	add_reference :users, :monitor, references: :users
  end
end
