class Answer < ApplicationRecord
  belongs_to :answer_group, inverse_of: :answers
  belongs_to :option, required: false
  belongs_to :question_value

  validates :option, presence: { on: :update }

  def evaluation_factor
    question_value.question.evaluation_factor
  end

  delegate :question, to: :question_value
end
