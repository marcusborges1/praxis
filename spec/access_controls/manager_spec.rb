require "rails_helper"
require "cancan/matchers"

RSpec.describe "Manager" do
  let(:manager_position) { FactoryGirl.create(:position, name: "Gerente") }
  let(:sector) { FactoryGirl.create(:sector)}
  let(:evaluation_model) { FactoryGirl.create(:evaluation_model, sector: sector) }
  let(:evaluation) { FactoryGirl.create(:evaluation, evaluation_model: evaluation_model,
                                                     evaluation_cycle: evaluation_cycle) }

  let(:other_evaluation) { FactoryGirl.create(:evaluation, evaluation_cycle: evaluation_cycle) }
  let(:other_user) { FactoryGirl.create(:user) }
  let(:evaluation_cycle) { FactoryGirl.create(:evaluation_cycle) }

  before(:each) do
    @user = FactoryGirl.create(:user, sector: sector, positions: [manager_position])
    @ability = Ability.new(@user)
  end

  it "can manage his project allocations" do
    expect(@ability).to be_able_to(:manage, ProjectAllocation)
  end

  it "can answer his evaluation" do
    expect(@ability).to be_able_to(:manage, evaluation)
  end

  it "can see and update itself" do
    expect(@ability).to be_able_to([:read, :update], @user)
  end

  it "can not answer evaluation of others" do
    someone_else_evaluation = FactoryGirl.create(:evaluation)
    expect(@ability).not_to be_able_to(:update, someone_else_evaluation.answer_groups.first)
  end

  it "can not manage other users" do
    expect(@ability).not_to be_able_to(:manage, other_user)
  end

  it "can not manage evaluation cycles" do
    expect(@ability).not_to be_able_to(:manage, EvaluationCycle)
  end

  it 'can create Evaluations' do 
    expect(@ability).to be_able_to(:create, Evaluation)
  end



end
