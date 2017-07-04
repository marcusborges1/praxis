class Question < ApplicationRecord
  has_many :options, inverse_of: :question, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true,
                                reject_if: :all_blank

  validates_presence_of :description, :evaluation_factor
end
