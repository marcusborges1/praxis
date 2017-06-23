class Question < ApplicationRecord
  validates_presence_of :name, :description, :evaluation_factor
end
