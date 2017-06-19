class RemoveUsersRefFromSector < ActiveRecord::Migration[5.0]
  def change
    remove_reference :sectors, :user, foreign_key: true
  end
end
