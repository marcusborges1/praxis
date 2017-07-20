class Answer < ApplicationRecord
  belongs_to :answer_group
  belongs_to :option
  belongs_to :question_value
end
