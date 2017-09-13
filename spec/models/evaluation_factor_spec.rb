require 'rails_helper'

RSpec.describe EvaluationFactor, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_one(:question).dependent(:destroy) }
end
