class Question < ApplicationRecord
  has_many :options
  validates_presence_of :name, :description, :evaluation_factor
end
