class Question < ApplicationRecord
  has_many :question_values, dependent: :destroy
  has_many :options, inverse_of: :question, dependent: :destroy
  belongs_to :evaluation_factor

  accepts_nested_attributes_for :options, allow_destroy: true

  validates :description, presence: true

  delegate :description, to: :question_value, prefix: true
  delegate :name, to: :evaluation_factor, prefix: true
end
