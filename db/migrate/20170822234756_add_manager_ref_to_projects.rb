class AddManagerRefToProjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :manager, references: :users, index: true
    add_foreign_key :projects, :users, column: :manager_id
  end
end
