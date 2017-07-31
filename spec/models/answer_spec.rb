require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:answer) { FactoryGirl.build(:answer) }

  it { should belong_to(:answer_group) }
  it { should belong_to(:option) }
  it { should belong_to(:question_value) }

  describe "when updating object" do
    let!(:answer) { FactoryGirl.create(:answer) }
    it "should validate option before update" do
      answer.option = nil
      expect(answer).not_to be_valid
    end
  end
end
