class Option < ApplicationRecord
  belongs_to :question, inverse_of: :options
  validates :weight, presence: true
end
