require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(name: "foo", description: "bar", evaluation_factor: "baz"),
      Question.create!(name: "foo", description: "bar", evaluation_factor: "baz")
    ])
  end

  it "renders a list of questions" do
    render
  end
end
