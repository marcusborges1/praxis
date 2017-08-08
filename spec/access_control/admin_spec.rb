require 'rails_helper'
require 'cancan/matchers'

RSpec.describe 'Admin' do
  let(:admin_position) { FactoryGirl.create(:position, name: 'Diretor') }

  before(:each) do
    @admin = FactoryGirl.create(:user, :people_management)
    @admin.positions << admin_position
    @ability = Ability.new(@admin)
  end

  it 'can manage Sectors' do
    expect(@ability).to be_able_to(:manage, Sector)
  end

  it 'can manage Positions' do
    expect(@ability).to be_able_to(:manage, Position)
  end

  it 'can manage Users' do
    expect(@ability).to be_able_to(:manage, User)
  end

  it 'can manage Evaluation Models' do
    expect(@ability).to be_able_to(:manage, EvaluationModel)
  end

  it 'can manage Questions' do
    expect(@ability).to be_able_to(:manage, Question)
  end

  it 'can manage Evaluations' do
    expect(@ability).to be_able_to(:manage, Evaluation)
  end

end
