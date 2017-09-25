class EvaluationFactor < ApplicationRecord
  has_one :question, dependent: :destroy
  validates_presence_of :name

  delegate :name, to: :question, prefix: true
end
