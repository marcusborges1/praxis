class Option < ApplicationRecord
  belongs_to :question, inverse_of: :options
  validates :description, presence: true
end
