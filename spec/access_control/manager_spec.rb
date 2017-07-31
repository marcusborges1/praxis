require 'rails_helper'
require 'cancan/matchers'

RSpec.describe 'Manager' do
  let(:position) { FactoryGirl.create(:position, name: 'Gerente') }
  let(:sector) { FactoryGirl.create(:sector)}
  let(:evaluation_model) { FactoryGirl.create(:evaluation_model, sector: sector)}
  let(:evaluation) { FactoryGirl.create(:evaluation, evaluation_model: evaluation_model) }
  let(:other_evaluation) { FactoryGirl.create(:evaluation) }
  let(:other_user) {FactoryGirl.create(:user)}

  before(:each) do
    @user = FactoryGirl.create(:user, sector: sector)
    @user.positions << position
    @ability = Ability.new(@user)
  end

  it 'can manage Project Allocations' do
    expect(@ability).to be_able_to(:manage, ProjectAllocation)
  end

  it 'can Answer to his Evaluation' do
    expect(@ability).to be_able_to(:manage, evaluation)
    expect(@ability).not_to be_able_to(:manage, other_evaluation)
  end

  it 'can edit itself' do
    expect(@ability).to be_able_to(:read, @user)
    expect(@ability).to be_able_to(:update, @user)
    expect(@ability).not_to be_able_to(:read, other_user)
  end

end
