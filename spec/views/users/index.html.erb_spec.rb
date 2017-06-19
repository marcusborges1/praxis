require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    @sector = assign(:sector, Sector.create!(name: "DAF"))
    assign(:users, [
      User.create!(name: "Name", sector: @sector),
      User.create!(name: "Name", sector: @sector)
    ])
  end

  it "renders a list of users" do
    render
  end
end
