require 'rails_helper'

RSpec.describe AnswerGroup, type: :model do
  let(:answer_group) { FactoryGirl.build(:answer_group) }

  it { should belong_to(:evaluation) }
  it { should belong_to(:user) }
end
