require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:answer) { FactoryGirl.build(:answer) }

  it { should belong_to(:answer_group) }
  it { should belong_to(:option) }
  it { should belong_to(:question_value) }
end
