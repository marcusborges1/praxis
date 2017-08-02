require 'rails_helper'

RSpec.describe AnswerGroup, type: :model do
  let(:answer_group) { FactoryGirl.build(:answer_group, evaluation: evaluation) }
  let!(:evaluation) { FactoryGirl.create(:evaluation, evaluation_model: evaluation_model) }
  let!(:evaluation_model) { FactoryGirl.create(:evaluation_model) }
  let!(:question_values) { FactoryGirl.create_list(:question_value, 2,
                                                   evaluation_model: evaluation_model) }

  it { is_expected.to belong_to(:evaluation) }
  it { is_expected.to belong_to(:user) }

  it "should create answers" do
    expect { answer_group.save }.to change(Answer, :count).by 2
  end
end
