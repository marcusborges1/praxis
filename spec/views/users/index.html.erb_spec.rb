require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, FactoryGirl.create_list(:user, 2))
  end

  xit "renders a list of users" do
    render
  end
end
