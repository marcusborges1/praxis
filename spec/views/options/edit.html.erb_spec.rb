require 'rails_helper'

RSpec.describe "options/edit", type: :view do
  before(:each) do
    question = Question.create(name: "foo1", description: "bar1", evaluation_factor: "baz1")
    @option = assign(:option, Option.create!(description: "MyString", question: question))
  end

  it "renders the edit option form" do
    render

    assert_select "form[action=?][method=?]", option_path(@option), "post" do

      assert_select "input#option_description[name=?]", "option[description]"
    end
  end
end
