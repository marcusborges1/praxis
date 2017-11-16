require "rails_helper"
require "cancan/matchers"

RSpec.describe "Admin" do
  let(:admin_position) { FactoryGirl.create(:position, name: "Diretor") }

  before(:each) do
    @admin = FactoryGirl.create(:user, :people_management)
    @admin.positions << admin_position
    @ability = Ability.new(@admin)
  end

  it "can manage all" do
    expect(@ability).to be_able_to(:manage, :all)
  end

  it "can set user monitors" do
    expect(@ability).to be_able_to(:set, :monitors)
  end
end
