require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    position = assign(:position, Position.create(name: "Position"))
    @sector = assign(:sector, Sector.create!(name: "DAF"))
    assign(:users, [
      User.create!(name: "name", position_id: position.id, sector: @sector),
      User.create!(name: "name", position_id: position.id, sector: @sector)
    ])
  end

  it "renders a list of users" do
    render
  end
end
