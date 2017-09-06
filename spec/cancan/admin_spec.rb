require "rails_helper"
require "cancan/matchers"

RSpec.describe "Admin" do
  let(:admin_position) { FactoryGirl.create(:position, name: "Diretor") }

  before(:each) do
    @admin = FactoryGirl.create(:user)
    @admin.positions << admin_position
    @ability = Ability.new(@admin)
  end

  it "can manage sectors" do
    expect(@ability).to be_able_to(:manage, Sector)
  end

  it "can manage positions" do
    expect(@ability).to be_able_to(:manage, Position)
  end

  it "can manage users" do
    expect(@ability).to be_able_to(:manage, User)
  end

  it "can manage evaluation models" do
    expect(@ability).to be_able_to(:manage, EvaluationModel)
  end

  it "can manage questions" do
    expect(@ability).to be_able_to(:manage, Question)
  end

  it "can manage evaluations" do
    expect(@ability).to be_able_to(:manage, Evaluation)
  end

  it "can manage evaluation cycles" do
    expect(@ability).to be_able_to(:manage, EvaluationCycle)
  end
end
