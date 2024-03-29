class EvaluationModel < ApplicationRecord
  has_many :question_values, inverse_of: :evaluation_model, dependent: :destroy
  has_one :evaluation, dependent: :destroy

  belongs_to :sector, optional: true
  belongs_to :project, optional: true

  accepts_nested_attributes_for :question_values, allow_destroy: true

  validates :name, presence: true
  validates :context, presence: true
  validate :must_have_one_target

  enum context: %i[sector project]

  delegate :name, to: :position, prefix: true
  delegate :name, to: :target, prefix: true

  delegate :users, to: :target, prefix: true

  def target
    context == 'sector' ? sector : project
  end

  private

  def must_have_one_target
    if sector.nil? && project.nil?
      errors.add(:base, "can't exists without a target")
    end
  end
end
