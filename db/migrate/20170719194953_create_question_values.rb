class CreateQuestionValues < ActiveRecord::Migration[5.0]
  def change
    create_table :question_values do |t|
      t.references :evaluation_model, foreign_key: true
      t.integer :value
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
