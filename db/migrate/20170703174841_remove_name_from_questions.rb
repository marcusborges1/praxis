class RemoveNameFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :name, :string
  end
end
