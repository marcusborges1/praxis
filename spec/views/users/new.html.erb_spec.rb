require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    @positions = assign(:positions, Position.all)
    assign(:user, User.new())
  end

  xit "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
    end
  end
end
