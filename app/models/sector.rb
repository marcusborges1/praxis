class Sector < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: true

  delegate :name, to: :evaluation_model, prefix: true

  scope :people_management, -> { find_by(name: 'GP') }
  scope :organizational_presidency, -> { find_by(name: 'PRESORG') }

  def advisors
    users.joins(:positions).where(positions: { name: 'Assessor' })
  end

  def director
    users.select { |user| user.positions.institutional_context.first.name == 'Diretor' }.first
  end
end
