require 'rails_helper'
require 'cancan/matchers'

RSpec.describe 'Authorizations for Admin' do
  let(:admin_position) { FactoryGirl.create(:position, name: 'Diretor') }

  before(:each) do
    @admin = FactoryGirl.create(:user)
    @admin.positions << admin_position
    @ability = Ability.new(@admin)
  end

  it 'Admin can manage Sectors' do
    expect(@ability).to be_able_to(:manage, Sector)
  end

  it 'Admin can manage Positions' do
    expect(@ability).to be_able_to(:manage, Position)
  end

  it 'Admin can manage Users' do
    expect(@ability).to be_able_to(:manage, User)
  end

  it 'Admin can manage Evaluation Models' do
    expect(@ability).to be_able_to(:manage, EvaluationModel)
  end

  it 'Admin can manage Questions' do
    expect(@ability).to be_able_to(:manage, Question)
  end

  it 'Admin can manage Evaluations' do
    expect(@ability).to be_able_to(:manage, Evaluation)
  end

  #
  # let(:user) { FactoryGirl.create(:user) }
  # let(:position) { Position.create(name: 'Assessor')}
  # user.update_attributes(position: position)
  #
  # it 'should be true' do
  #   puts user.position
  #   ability = Ability.new(user)
  #   expect(ability).to be_able_to(:manage, User.new)
  # end

end
