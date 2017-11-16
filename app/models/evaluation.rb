class Evaluation < ApplicationRecord
  attr_accessor :evaluation_target_id, :reviewer_id

  has_many :answer_groups, dependent: :destroy
  belongs_to :evaluation_model
  belongs_to :evaluation_cycle

  validates_presence_of :name
  validates_presence_of :start_date
  validates_presence_of :finish_date

  after_save :create_answer_groups

  delegate :duration_period, to: :evaluation_cycle, prefix: true
  delegate :name, to: :evaluation_model, prefix: true

  def question_values
    QuestionValue.where(evaluation_model_id: evaluation_model.id)
  end

  def members
    evaluation_model.target_users
  end

  private

  def create_answer_groups
    users = evaluation_model.target_users
    users.each do |evaluation_target|
      users.map { |user| AnswerGroup.create(evaluation: self, user: user, evaluation_target: evaluation_target) }
    end
  end
end
