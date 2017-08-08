class AnswerGroup < ApplicationRecord
  belongs_to :evaluation
  belongs_to :user
  belongs_to :evaluation_target, class_name: 'User'
  has_many :answers, inverse_of: :answer_group, dependent: :destroy
  validates_presence_of :answers, on: :update
  accepts_nested_attributes_for :answers

  after_create :create_answers

  def finished?
    answers.pluck(:option_id).exclude?(nil)
  end

  private

  def create_answers
    question_values = evaluation.question_values
    question_values.map { |question_value| Answer.create(answer_group: self, question_value: question_value, option: nil) }
  end
end
