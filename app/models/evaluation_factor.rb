class EvaluationFactor < ApplicationRecord
  has_one :question, dependent: :destroy
  validates :name, presence: true

  delegate :name, to: :question, prefix: true
end
