require 'rails_helper'

RSpec.describe "options/index", type: :view do
  before(:each) do
    question = Question.create(name: "foo1", description: "bar1", evaluation_factor: "baz1")
    assign(:options, [
      Option.create!(
        description: "Description",
        question: question
      ),
      Option.create!(
        description: "Description",
        question: question
      )
    ])
  end

  it "renders a list of options" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
