class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :name
      t.string :evaluation_factor
      t.text :description
      t.text :option1
      t.text :option2
      t.text :option3
      t.text :option4

      t.timestamps
    end
  end
end
