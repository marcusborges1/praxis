class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :position
  belongs_to :sector

  has_many :project_allocations
  has_many :projects, through: :project_allocations

  has_many :user_positions
  has_many :positions, through: :user_positions

  validates :name, presence: true

  delegate :name, to: :sector, prefix: true
  delegate :name, to: :position, prefix: true
end
