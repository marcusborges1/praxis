class Answer < ApplicationRecord
  belongs_to :answer_group, inverse_of: :answers
  belongs_to :option, required: false
  belongs_to :question_value
end
