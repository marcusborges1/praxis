require 'rails_helper'
require 'cancan/matchers'

RSpec.describe 'Director' do
  let(:director_position) { FactoryGirl.create(:position, name: 'Diretor') }

  before(:each) do
    @sector = FactoryGirl.create(:sector)
    @director = FactoryGirl.create(:user, sector: @sector)
    @director.positions << director_position
    @ability = Ability.new(@director)
  end

  it 'can read their sector evaluations' do
    expect(@ability).to be_able_to(:read, Evaluation, evaluation_model: { sector_id: @sector.id })
  end
end
