class User < ApplicationRecord
  belongs_to :sector
  validates :name, presence: true
end
