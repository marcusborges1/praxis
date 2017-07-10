class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :answer_groups
  belongs_to :position
  belongs_to :sector

  validates :name, presence: true

  delegate :name, to: :sector, prefix: true
  delegate :name, to: :position, prefix: true
end
