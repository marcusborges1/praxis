class EvaluationCycle < ApplicationRecord
  has_many :evaluations

  validate :initial_date_less_than_end_date

  scope :in_progress_now, -> { where("end_date >= ?", DateTime.now) }

  def finished?
    end_date < DateTime.now
  end

  def self.any_in_progress?
    where("end_date >= ?", DateTime.now).any?
  end

  def duration_period
    "#{format_datetime(initial_date)} - #{format_datetime(end_date)}"
  end

  private

  def initial_date_less_than_end_date
    unless initial_date < end_date
      errors.add(:initial_date, "can't be bigger or equal to end date")
    end
  end

  def format_datetime(datetime)
    datetime.strftime("%d/%m/%Y")
  end
end
