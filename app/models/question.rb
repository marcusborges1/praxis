class Question < ApplicationRecord
  validates_presence_of :name, :description, :evaluation_factor, :option1,
                        :option2, :option3, :option4
end
