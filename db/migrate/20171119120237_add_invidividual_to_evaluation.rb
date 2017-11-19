class AddInvidividualToEvaluation < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :individual, :boolean
  end
end
