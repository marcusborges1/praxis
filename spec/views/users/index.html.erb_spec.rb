require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    position = assign(:position, Position.create(name: "Position"))
    assign(:users, [
      User.create!(name: "name", position_id: position.id),
      User.create!(name: "name", position_id: position.id)
    ])
  end

  it "renders a list of users" do
    render
  end
end
