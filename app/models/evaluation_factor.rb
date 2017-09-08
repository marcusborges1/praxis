class EvaluationFactor < ApplicationRecord
 belongs_to :question, required: false

 validates_presence_of :name
end
