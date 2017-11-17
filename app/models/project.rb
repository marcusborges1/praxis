class Project < ApplicationRecord
  has_many :project_allocations
  has_many :users, through: :project_allocations
  has_many :evaluation_models

  belongs_to :leader, class_name: 'User'
  belongs_to :manager, class_name: 'User'

  validates :name, presence: true

  delegate :name, to: :leader, prefix: true
  delegate :name, to: :manager, prefix: true
end
