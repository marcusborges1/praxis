require 'rails_helper'

RSpec.describe "positions/index", type: :view do

  before(:each) do
    assign(:positions, FactoryGirl.create_list(:position, 2, name: "Name"))
  end

  it "renders a list of positions" do
    render
    assert_select "tr>td", text: "Name", count: 2
  end
end
