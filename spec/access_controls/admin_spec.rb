require "rails_helper"
require "cancan/matchers"

RSpec.describe "Admin" do
  let(:admin_position) { FactoryGirl.create(:position, name: "Diretor") }

  before(:each) do
    @admin = FactoryGirl.create(:user, :people_management)
    @admin.positions << admin_position
    @ability = Ability.new(@admin)
  end

  xit "can manage sectors" do
    expect(@ability).to be_able_to(:manage, Sector)
  end

  xit "can manage positions" do
    expect(@ability).to be_able_to(:manage, Position)
  end

  xit "can manage users" do
    expect(@ability).to be_able_to(:manage, User)
  end

  xit "can manage evaluation models" do
    expect(@ability).to be_able_to(:manage, EvaluationModel)
  end

  xit "can manage questions" do
    expect(@ability).to be_able_to(:manage, Question)
  end

  xit "can manage evaluations" do
    expect(@ability).to be_able_to(:manage, Evaluation)
  end

  xit "can manage answer_groups" do
    expect(@ability).to be_able_to(:manage, AnswerGroup)
  end

  it "can manage all" do
    expect(@ability).to be_able_to(:manage, :all)
  end

  it "can set user monitors" do
    expect(@ability).to be_able_to(:set, :monitors)
  end
end
