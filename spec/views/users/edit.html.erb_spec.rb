require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    position = assign(:position, Position.create(name: "Position"))
    @positions = assign(:positions, Position.all)
    @user = assign(:user, User.create!(name: "name", position_id: position.id))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do
    end
  end
end
