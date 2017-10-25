class CreateEvaluationComments < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluation_comments do |t|
      t.text :comment
      t.references :answer_group, foreign_key: true

      t.timestamps
    end
  end
end
