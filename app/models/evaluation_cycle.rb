class EvaluationCycle < ApplicationRecord
  has_many :evaluations

  validate :only_one_cycle_in_progress_per_time, on: :create
  validate :initial_date_less_than_end_date
  validate :finished_cycle_can_not_be_updated, on: :update

  def finished?
    end_date < DateTime.now
  end

  def self.any_in_progress?
    where("end_date >= ?", DateTime.now).any?
  end

  private

  def only_one_cycle_in_progress_per_time
    errors.add(:base, "can't have more than one cycle in progress per time") if EvaluationCycle.any_in_progress?
  end

  def initial_date_less_than_end_date
    unless initial_date < end_date
      errors.add(:initial_date, "can't be bigger or equal to end date")
    end
  end

  def finished_cycle_can_not_be_updated
    errors.add(:base, "can't update finished cycle") if finished?
  end
end
