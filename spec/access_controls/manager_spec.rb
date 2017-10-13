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

  it "can not manage other users" do
    expect(@ability).not_to be_able_to(:manage, other_user)
  end
end
