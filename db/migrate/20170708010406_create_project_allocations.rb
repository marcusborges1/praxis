class CreateProjectAllocations < ActiveRecord::Migration[5.0]
  def change
    create_table :project_allocations do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end

    add_index :project_allocations, [:project_id, :user_id]
  end
end
