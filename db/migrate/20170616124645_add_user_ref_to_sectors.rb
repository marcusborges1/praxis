class AddUserRefToSectors < ActiveRecord::Migration[5.0]
  def change
    add_reference :sectors, :user, foreign_key: true
  end
end
