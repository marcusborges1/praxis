class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :sector
  belongs_to :monitor, class_name: "User"

  has_many :project_allocations
  has_many :projects, through: :project_allocations

  has_many :user_positions
  has_many :positions, through: :user_positions, dependent: :destroy

  validates :name, presence: true

  validate :has_at_least_one_position
  validate :has_exactly_one_institutional_position, on: :update

  delegate :name, to: :sector, prefix: true

  def has_position?  (position)
    return false if position == nil
    user_positions.find_by(position_id: position.id).present?
  end

  private
  def has_at_least_one_position
    errors.add(:positions, "must be at least one") if position_ids.blank?
  end

  def has_exactly_one_institutional_position
    if positions.institutional_context.length != 1
      errors.add(:positions, "must contain exactly one institutional user")
    end
  end
end
