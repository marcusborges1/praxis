require "rails_helper"
require "cancan/matchers"

RSpec.describe "User" do
  let(:user) {FactoryGirl.create(:user)}
  let(:answer_group) {FactoryGirl.create(:answer_group, user: user)}
  let(:another_answer_group) {FactoryGirl.create(:answer_group)}

  before(:each) do
    @ability = Ability.new(user)
  end

  it "can answer his evaluation" do
    expect(@ability).to be_able_to(:read, answer_group)
    expect(@ability).to be_able_to(:update, answer_group)
  end

  it "cannot answer another user evaluation" do
    expect(@ability).not_to be_able_to(:read, another_answer_group)
    expect(@ability).not_to be_able_to(:update, another_answer_group)
  end
end
