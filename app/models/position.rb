class Position < ApplicationRecord
  has_many :user_positions
  has_many :users, through: :user_positions, dependent: :destroy

  validates :name, presence: true
  validates :context, presence: true

  scope :advisors, -> { find_by(name: 'Assessor') }

  enum context: %i[institutional project], _suffix: true
end
