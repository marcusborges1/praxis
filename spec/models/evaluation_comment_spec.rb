require 'rails_helper'

RSpec.describe EvaluationComment, type: :model do
  it { is_expected.to belong_to(:answer_group) }
end
