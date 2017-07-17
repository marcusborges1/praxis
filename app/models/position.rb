class Position < ApplicationRecord
  has_many :user_positions
  has_many :users, through: :user_positions, dependent: :destroy

  validates :name, presence: true
  validates :context, presence: true

  enum context: [:institutional, :project], _prefix: true
end
