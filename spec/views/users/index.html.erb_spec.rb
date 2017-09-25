require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, FactoryGirl.create_list(:user, 2))
  end

  it "renders a list of users" do
    allow(view).to receive(:can?).and_return(true)
    render
  end
end
