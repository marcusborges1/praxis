class User < ApplicationRecord
  belongs_to :position, dependent: :destroy
  belongs_to :sector
  
  validates :name, presence: true
  
  delegate :name, to: :sector, prefix: true
  delegate :name, to: :position, prefix: true
end
