class TransformEvaluationFactorInQuestionToReferences < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :evaluation_factor, :string
    add_reference :questions, :evaluation_factor, index: true
  end
end
