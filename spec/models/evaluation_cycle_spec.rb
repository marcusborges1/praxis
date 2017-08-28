require 'rails_helper'

RSpec.describe EvaluationCycle, type: :model do
  it { is_expected.to have_many(:evaluations) }

  it "can't have initial date bigger than end date" do
    evaluation_cycle = FactoryGirl.build(:evaluation_cycle, initial_date: DateTime.now,
                                                            end_date: DateTime.yesterday)
    expect(evaluation_cycle).to_not be_valid
  end

  it "can't have initial date equal to end date" do
    now = DateTime.now
    evaluation_cycle = FactoryGirl.build(:evaluation_cycle, initial_date: now, end_date: now)
    expect(evaluation_cycle).to_not be_valid
  end

  it "has only one cycle in progress per time" do
    FactoryGirl.create(:evaluation_cycle, :in_progress)
    second_cycle_in_progress = FactoryGirl.build(:evaluation_cycle, :in_progress)
    expect(second_cycle_in_progress).to_not be_valid
  end

  describe "#finished?" do
    it "returns true when end date is less than today" do
      evaluation_cycle = FactoryGirl.create(:evaluation_cycle, :finished)
      expect(evaluation_cycle.finished?).to eq true
    end

    it "returns false when end date is bigger or equal to today" do
      evaluation_cycle = FactoryGirl.create(:evaluation_cycle, :in_progress)
      expect(evaluation_cycle.finished?).to eq false
    end
  end

  describe ".any_in_progress?" do
    it "returns false when there is no cycle in progress now" do
      expect(EvaluationCycle.any_in_progress?).to eq false
    end

    it "returns true when there is a cycle in progress now" do
      FactoryGirl.create(:evaluation_cycle, :in_progress)
      expect(EvaluationCycle.any_in_progress?).to eq true
    end
  end
end
