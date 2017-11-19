class RenameUserToEvaluationTargetOnEvaluation < ActiveRecord::Migration[5.0]
  def change
    rename_column :evaluations, :user_id, :evaluation_target_id
  end
end
