require 'rails_helper'

RSpec.describe EvaluationCycle, type: :model do
  it { is_expected.to have_many(:evaluations) }
end
