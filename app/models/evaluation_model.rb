class EvaluationModel < ApplicationRecord
  has_many :question_values, inverse_of: :evaluation_model, dependent: :destroy
  accepts_nested_attributes_for :question_values, allow_destroy: true
  belongs_to :sector

  validates_presence_of :name

  delegate :name, to: :position, prefix: true
  delegate :name, to: :sector, prefix: true

  def users
    User.where(sector: sector)
  end
end
