require 'rails_helper'

RSpec.describe Evaluation, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:finish_date) }

  it { is_expected.to belong_to(:evaluation_model) }
  it { is_expected.to have_many(:answer_groups).dependent(:destroy) }
  it { is_expected.to belong_to(:evaluation_cycle) }

  let(:evaluation) { FactoryGirl.build(:evaluation) }
  let!(:question_values) { FactoryGirl.create_list(:question_value, 2,
                                                   evaluation_model: evaluation.evaluation_model) }
  let!(:users) { FactoryGirl.create_list(:user, 3,
                                         sector: evaluation.evaluation_model.sector) }

  describe "after creation of an evaluation" do
    it "creates answer groups" do
      expect { evaluation.save }.to change(AnswerGroup, :count).by 6
    end
  end

  describe "#question_values" do
    it "returns parent evaluation model question values" do
      expect(evaluation.question_values.count).to eq 2
    end
  end
end
