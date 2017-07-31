require 'rails_helper'

RSpec.describe EvaluationModel, type: :model do
  it { should validate_presence_of(:name) }

  it { should belong_to(:sector) }
  it { should have_many(:question_values).dependent(:destroy) }
  it { should accept_nested_attributes_for(:question_values) }
end
