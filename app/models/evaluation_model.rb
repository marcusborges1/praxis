class EvaluationModel < ApplicationRecord
  has_many :question_values, inverse_of: :evaluation_model, dependent: :destroy
  has_one :evaluation, dependent: :destroy
  belongs_to :sector

  accepts_nested_attributes_for :question_values, allow_destroy: true

  validates_presence_of :name

  enum context: [:sector, :project, :user]

  delegate :name, to: :position, prefix: true
  delegate :name, to: :sector, prefix: true

  def users
    User.where(sector: sector)
  end
end
