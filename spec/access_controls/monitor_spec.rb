require 'rails_helper'
require 'cancan/matchers'

RSpec.describe 'Monitor' do
  before(:each) do
    @people_management = FactoryGirl.create(:sector, name: 'GP')
    @monitor = FactoryGirl.create(:user, sector: @people_management)
    @ability = Ability.new(@monitor)
  end

  it 'can read evaluations' do
    expect(@ability).to be_able_to(:read, Evaluation)
  end

  it 'can read accompanied individual_reports' do
    @users = FactoryGirl.create_list(:user, 2)
    @users.map { |user| user.update(monitor: @monitor) }
    expect(@ability).to be_able_to(:individual_report, AnswerGroup, evaluation_target_id: User.where(monitor: @monitor).pluck(:id))
  end
end
