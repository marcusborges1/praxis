class Evaluation < ApplicationRecord
  has_many :answer_groups
  belongs_to :evaluation_model
  validates_presence_of :name
  validates_presence_of :start_date
  validates_presence_of :finish_date
end
