require 'rails_helper'

RSpec.describe Evaluation, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:finish_date) }

  it { is_expected.to have_many(:answer_groups).dependent(:destroy) }
  it { is_expected.to belong_to(:evaluation_cycle) }
  it { is_expected.to belong_to(:evaluation_model) }

  it "is linked to the current evaluation cycle in progress" do
    current_evaluation_cycle = FactoryGirl.create(:evaluation_cycle, :in_progress)
    evaluation = Evaluation.create(name: "oi", start_date: DateTime.now, finish_date: DateTime.tomorrow,
                                  evaluation_model: FactoryGirl.create(:evaluation_model))
    expect(evaluation.evaluation_cycle).to eq(current_evaluation_cycle)
  end
end
