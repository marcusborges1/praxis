class Sector < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: true

  def director
    # "Diretor" will be refactored
    users.select { |user| user.position_name == "Diretor" }.first
  end
end
