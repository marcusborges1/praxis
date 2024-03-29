class AnswerGroup < ApplicationRecord
  has_many :answers, inverse_of: :answer_group, dependent: :destroy
  has_one :evaluation_comment, dependent: :destroy
  belongs_to :user
  belongs_to :evaluation
  belongs_to :evaluation_target, class_name: 'User'

  validates :answers, presence: { on: :update }

  accepts_nested_attributes_for :answers
  accepts_nested_attributes_for :evaluation_comment, update_only: true

  after_create :create_answers
  after_create :notify_users

  def finished?
    answers.pluck(:option_id).exclude?(nil)
  end

  private

  def create_answers
    question_values = evaluation.question_values
    question_values.map { |question_value| Answer.create(answer_group: self, question_value: question_value, option: nil) }
  end

  def notify_users
    NotificationsMailer.new_evaluation_available(user_id, evaluation_id).deliver_now
  end
end
