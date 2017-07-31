class Evaluation < ApplicationRecord
  has_many :answer_groups
  belongs_to :evaluation_model
  validates_presence_of :name
  validates_presence_of :start_date
  validates_presence_of :finish_date

  after_create :create_answer_groups

  def question_values
    QuestionValue.where(evaluation_model_id: evaluation_model.id)
  end

  private

  def create_answer_groups
    users = evaluation_model.users
    users.map { |user| AnswerGroup.create(evaluation: self, user: user) }
  end
end
