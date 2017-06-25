require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    position = assign(:position, Position.create(name: "Position"))
    @sector = assign(:sector, Sector.create!(name: "DAF"))
    @user = assign(:user, User.create!(name: "name", position_id: position.id, sector: @sector))
  end

  it "renders attributes in <p>" do
    render
  end
end
