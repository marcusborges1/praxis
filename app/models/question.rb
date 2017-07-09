class Question < ApplicationRecord
  has_many :options, inverse_of: :question, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true

  validates_presence_of :description, :evaluation_factor
end
