class Evaluation < ApplicationRecord
  belongs_to :evaluation_model
  validates_presence_of :start_date
  validates_presence_of :finish_date
end
