class AnswerGroup < ApplicationRecord
  belongs_to :evaluation
  belongs_to :user
  has_many :answers, inverse_of: :answer_group, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  after_create :create_answers

  private

  def create_answers
    question_values = evaluation.questions
    question_values.map { |question_value| Answer.create(answer_group: self, question_value: question_value, option: nil) }
  end
end
