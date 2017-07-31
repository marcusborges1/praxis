class QuestionValue < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :evaluation_model, inverse_of: :question_values
  belongs_to :question

  validates_presence_of :value

  def options
    Option.where(question: question)
  end

  def description
    question.description
  end
end
