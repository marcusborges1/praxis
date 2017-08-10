class Project < ApplicationRecord
  has_many :project_allocations
  has_many :users, through: :project_allocations

  belongs_to :leader, class_name: "User"

  validates :name, presence: true
end
