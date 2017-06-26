require 'rails_helper'

RSpec.describe "sectors/index", type: :view do
  before(:each) do
    director_position = Position.create(name: "Diretor")
    assign(:director_position, director_position)
    sectors = [
      Sector.create!(name: "DAF"),
      Sector.create!(name: "DEF")
    ]
    assign(:sectors, sectors)
    assign(:users, [
      User.create(name: "Foo", sector: sectors.first, position: director_position),
      User.create(name: "Bar", sector: sectors.second, position: director_position)
    ])
  end

  it "renders a list of sectors" do
    render
  end
end
