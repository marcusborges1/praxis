class QuestionValue < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :evaluation_model, inverse_of: :question_values
  belongs_to :question

  validates :value, presence: true

  def options
    Option.where(question: question)
  end

  delegate :description, to: :question
end
