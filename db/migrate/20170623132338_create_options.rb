class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :description

      t.timestamps
    end
  end
end
