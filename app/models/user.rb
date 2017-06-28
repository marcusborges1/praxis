class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :position
  belongs_to :sector

  validates :name, presence: true

  delegate :name, to: :sector, prefix: true
  delegate :name, to: :position, prefix: true
end
