class Sector < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: true

  delegate :name, to: :evaluation_model, prefix: true

 	scope :people_management_sector, -> { find_by(name: 'Gestão de Pessoas') }
 	scope :org_pres_sector, -> {find_by(name: 'Presidência Organizacional')}
  
  # def director
  #   "Diretor" will be refactored
  #   users.select { |user| user.position.institutional_context.first.name == "Diretor" }.first
  # end
end
