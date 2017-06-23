class Question < ApplicationRecord
  has_many :options
  accepts_nested_attributes_for :options, allow_destroy: true,
                                reject_if: :all_blank

  validates_presence_of :name, :description, :evaluation_factor
end
