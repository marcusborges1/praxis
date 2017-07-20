require 'rails_helper'
require 'cancan/matchers'

RSpec.describe "Authorizations" do

  let(:user) { FactoryGirl.create(:user) }

  it "should be true" do
    ability = Ability.new(user)
    expect(ability).to be_able_to(:manage, User.new)
  end

end
