class Evaluation < ApplicationRecord
  attr_accessor :evaluation_target_id, :reviewer_id

  has_many :answer_groups, dependent: :destroy
  belongs_to :evaluation_model
  belongs_to :evaluation_cycle

  validates_presence_of :name
  validates_presence_of :start_date
  validates_presence_of :finish_date

  delegate :duration_period, to: :evaluation_cycle, prefix: true
  delegate :name, to: :evaluation_model, prefix: true

  def question_values
    QuestionValue.where(evaluation_model_id: evaluation_model.id)
  end

  def create_answer_groups
    users = evaluation_model.users
    users.each do |evaluation_target|
      users.map { |user| AnswerGroup.create(evaluation: self, user: user, evaluation_target: evaluation_target) }
    end
  end

  def create_answer_group(evaluation_target_params)
    AnswerGroup.create(evaluation: self, user_id: evaluation_target_params[:reviewer_id],
                      evaluation_target_id: evaluation_target_params[:evaluation_target_id])
  end
end
