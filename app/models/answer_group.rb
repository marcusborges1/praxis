class AnswerGroup < ApplicationRecord
  belongs_to :evaluation
  belongs_to :user
  has_many :answers, inverse_of: :answer_group, dependent: :destroy
  accepts_nested_attributes_for :answers

  after_create :create_answers

  def finished?
    answered = true
    answers.map { |answer| answered = false if answer.option.nil? }
    answered
  end

  private

  def create_answers
    question_values = evaluation.question_values
    question_values.map { |question_value| Answer.create(answer_group: self, question_value: question_value, option: nil) }
  end
end
