require 'rails_helper'

RSpec.describe Evaluation, type: :model do
  let(:evaluation) { FactoryGirl.build(:evaluation) }
  let!(:users) { FactoryGirl.create_list(:user, 2,
                                         sector: evaluation.evaluation_model.sector) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:finish_date) }

  it { should belong_to(:evaluation_model) }
  it { should have_many(:answer_groups) }

  it "should create answer groups" do
    expect { evaluation.save }.to change(AnswerGroup, :count).by 2
  end
end
