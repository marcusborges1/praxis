class User < ApplicationRecord
  belongs_to :position, dependent: :destroy
  validates :name, presence: true
  delegate :name, to: :position, prefix: true
end
