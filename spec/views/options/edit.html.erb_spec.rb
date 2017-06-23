require 'rails_helper'

RSpec.describe "options/edit", type: :view do
  before(:each) do
    @option = assign(:option, Option.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit option form" do
    render

    assert_select "form[action=?][method=?]", option_path(@option), "post" do

      assert_select "input#option_description[name=?]", "option[description]"
    end
  end
end
