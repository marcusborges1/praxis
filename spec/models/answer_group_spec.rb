require 'rails_helper'

RSpec.describe AnswerGroup, type: :model do
  let(:answer_group) { FactoryGirl.build(:answer_group, evaluation: evaluation) }
  let!(:evaluation) { FactoryGirl.create(:evaluation, evaluation_model: evaluation_model) }
  let!(:evaluation_model) { FactoryGirl.create(:evaluation_model) }
  let!(:question_value) { FactoryGirl.create(:question_value, evaluation_model: evaluation_model) }

  it { is_expected.to belong_to(:evaluation) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_one(:evaluation_comment) }
  it { is_expected.to validate_presence_of(:answers).on(:update) }
  it { is_expected.to accept_nested_attributes_for(:evaluation_comment) }

  context "when creating answer_groups" do
    it "creates answers" do
      expect { answer_group.save }.to change(Answer, :count).by 1
    end
  end

  context "when editing answer_groups" do
    let!(:option) { FactoryGirl.create(:option, question: question_value.question) }
    before(:each) { answer_group.save }

    it "returns false if any option from answers of answer group is nil" do
      expect(answer_group.finished?).to eq false
    end

    it "returns true if option from answers of answer group is not nil" do
      answer_group.answers.first.update(option: option)
      expect(answer_group.finished?).to eq true
    end
  end
end
