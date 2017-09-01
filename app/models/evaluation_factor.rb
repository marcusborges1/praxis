class EvaluationFactor < ApplicationRecord
 belongs_to :question

 validates_presence_of :name
end
