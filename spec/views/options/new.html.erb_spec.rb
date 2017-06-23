require 'rails_helper'

RSpec.describe "options/new", type: :view do
  before(:each) do
    question = Question.create(name: "foo1", description: "bar1", evaluation_factor: "baz1")
    assign(:option, Option.new(
      description: "MyString",
      question: question
    ))
  end

  it "renders new option form" do
    render

    assert_select "form[action=?][method=?]", options_path, "post" do

      assert_select "input#option_description[name=?]", "option[description]"
    end
  end
end
