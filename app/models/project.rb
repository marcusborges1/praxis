class Project < ApplicationRecord
  has_many :project_allocations
  has_many :users, through: :project_allocations

  validates :name, presence: true
end
