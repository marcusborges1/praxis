class Question < ApplicationRecord
  has_many :question_values, dependent: :destroy
  has_many :options, inverse_of: :question, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true

  validates_presence_of :description, :evaluation_factor

  delegate :description, to: :question_values, prefix: true
end
