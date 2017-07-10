class EvaluationModel < ApplicationRecord
  has_many :questions
  belongs_to :sector
  belongs_to :position

  validates_presence_of :name

  delegate :name, to: :position, prefix: true
  delegate :name, to: :sector, prefix: true
end
