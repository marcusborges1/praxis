require 'rails_helper'

RSpec.describe EvaluationModel, type: :model do
  it { should validate_presence_of(:name) }

  it { should belong_to(:position) }
  it { should belong_to(:sector) }
  it { should have_many(:questions) }
end
