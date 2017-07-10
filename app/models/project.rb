class Project < ApplicationRecord
  has_many :project_allocations
  has_many :users, through: :project_allocations

  validates :name, presence: true
  validate :has_one_user_at_least

  private
  def has_one_user_at_least
    if users.empty?
      errors.add(:users, "need one user at least")
    end
  end
end
