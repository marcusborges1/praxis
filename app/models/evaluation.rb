class Evaluation < ApplicationRecord
  attr_accessor :evaluation_target_id, :reviewer_id

  has_many :answer_groups, dependent: :destroy
  belongs_to :evaluation_model
  belongs_to :evaluation_cycle

  validates :name, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true

  delegate :duration_period, to: :evaluation_cycle, prefix: true
  delegate :name, to: :evaluation_model, prefix: true

  def question_values
    QuestionValue.where(evaluation_model_id: evaluation_model.id)
  end

  def members
    evaluation_model.target_users
  end

  
  def create_answer_groups(target=nil)
    if individual?
      create_individual_answer_groups(target.to_i, self)
    else
      members.each { |target_user| create_individual_answer_groups(target_user, self) }
    end
  end

  private
  
  def create_individual_answer_groups(target, evaluation)
    members.each { |user| AnswerGroup.create(evaluation: evaluation, user: user, evaluation_target_id: target) }
  end
end
