class EvaluationFactor < ApplicationRecord
  has_one :question, dependent: :destroy
  validates_presence_of :name
end
