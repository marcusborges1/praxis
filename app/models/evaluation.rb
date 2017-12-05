class Evaluation < ApplicationRecord
  has_many :answer_groups, dependent: :destroy
  belongs_to :evaluation_model
  belongs_to :evaluation_cycle
  belongs_to :evaluation_target, class_name: 'User', optional: true

  validates :name, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true

  after_create :create_answer_groups

  delegate :duration_period, to: :evaluation_cycle, prefix: true
  delegate :name, to: :evaluation_model, prefix: true

  def question_values
    QuestionValue.where(evaluation_model_id: evaluation_model.id)
  end

  def members
    if individual?
      answer_groups.map{ |answer_group| answer_group.evaluation_target }.uniq
    else
      evaluation_model.target_users
    end
  end

  def individual_member
  end
  
  private
  def create_answer_groups
    if individual?
      create_individual_answer_groups(evaluation_target, self)
    else
      members.each { |target_user| create_individual_answer_groups(target_user, self) }
    end
  end
  
  def create_individual_answer_groups(target, evaluation)
    members.each { |user| AnswerGroup.create(evaluation: evaluation, user: user, evaluation_target: target) }
  end
end
