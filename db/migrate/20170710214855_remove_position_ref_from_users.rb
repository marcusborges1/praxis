class RemovePositionRefFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :users, :position, foreign_key: true
  end
end
