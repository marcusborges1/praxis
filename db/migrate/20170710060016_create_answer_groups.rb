class CreateAnswerGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_groups do |t|
      t.references :evaluation, foreign_key: true

      t.timestamps
    end
  end
end
