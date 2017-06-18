class User < ApplicationRecord
  belongs_to :sector
  delegate :name, to: :sector, prefix: true

  validates :name, presence: true
end
