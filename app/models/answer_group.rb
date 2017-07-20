class AnswerGroup < ApplicationRecord
  belongs_to :evaluation
  belongs_to :user
  has_many :answers
end
