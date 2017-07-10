class Sector < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: true

  delegate :name, to: :evaluation_model, prefix: true

  # def director
  #   "Diretor" will be refactored
  #   users.select { |user| user.position_name == "Diretor" }.first
  # end
end
