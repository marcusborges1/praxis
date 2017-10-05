class EvaluationComment < ApplicationRecord
  belongs_to :answer_group
  validates_presence_of :comment
end
