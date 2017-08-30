class Evaluation < ApplicationRecord
  has_many :answer_groups, dependent: :destroy
  belongs_to :evaluation_model
  belongs_to :evaluation_cycle

  validates_presence_of :name
  validates_presence_of :start_date
  validates_presence_of :finish_date

  before_validation :link_to_current_evaluation_cycle
  after_create :create_answer_groups

  def question_values
    QuestionValue.where(evaluation_model_id: evaluation_model.id)
  end

  private

  def create_answer_groups
    users = evaluation_model.users
    users.map { |user| AnswerGroup.create(evaluation: self, user: user) }
  end

  def link_to_current_evaluation_cycle
    self.evaluation_cycle = EvaluationCycle.in_progress_now
  end
end
