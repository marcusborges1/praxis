class ChangeIndividualDefaultValueFromEvaluation < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:evaluations, :individual, false)
  end
end
