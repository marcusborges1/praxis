class AnswerGroup < ApplicationRecord
  belongs_to :evaluation
  belongs_to :user
  has_many :answers, inverse_of: :answer_group, dependent: :destroy

  after_create :create_answers

  private

  def create_answers
    questions = evaluation.questions
    questions.map { |question| Answer.create(answer_group: self, question_value: question, option: nil) }
  end
end
