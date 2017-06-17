require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @sector = assign(:sector, Sector.create!(name: "DAF"))
    @user = assign(:user, User.create!(name: "name", sector: @sector))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do
    end
  end
end
