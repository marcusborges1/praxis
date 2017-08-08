require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:answer) { FactoryGirl.build(:answer) }

  it { is_expected.to belong_to(:answer_group) }
  it { is_expected.to belong_to(:option) }
  it { is_expected.to belong_to(:question_value) }

  describe "when updating object" do
    let!(:answer) { FactoryGirl.create(:answer) }
    it "should validate option before update" do
      answer.option = nil
      expect(answer).not_to be_valid
    end
  end
end
