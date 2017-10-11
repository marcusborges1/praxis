require "rails_helper"
require "cancan/matchers"

RSpec.describe "Director" do
  let(:director_position) { FactoryGirl.create(:position, name: "Diretor") }

  before(:each) do
    @sector = FactoryGirl.create(:sector)
    @director = FactoryGirl.create(:user, sector: @sector)
    @director.positions << director_position
    @ability = Ability.new(@director)
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

  it "can read their sector evaluations" do
    expect(@ability).to be_able_to(:read, Evaluation, evaluation_model: { sector_id: @sector.id })
  end

  it "can manage projects" do
    expect(@ability).to be_able_to(:manage, Project)
  end
end
