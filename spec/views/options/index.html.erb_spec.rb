require 'rails_helper'

RSpec.describe "options/index", type: :view do
  before(:each) do
    assign(:options, [
      Option.create!(
        :description => "Description"
      ),
      Option.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of options" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
