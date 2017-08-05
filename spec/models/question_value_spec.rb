require 'rails_helper'

RSpec.describe QuestionValue, type: :model do
  let(:question_value) { Factory.build(:question_value) }

  it { should belong_to(:evaluation_model) }
  it { should belong_to(:question) }
  it { should have_many(:answers).dependent(:destroy) }
  it { should validate_presence_of(:value)  }
end
