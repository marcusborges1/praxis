require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(name: "foo", description: "bar", evaluation_factor: "baz",
                   option1: "f", option2: "o", option3: "b", option4: "a"),
      Question.create!(name: "foo", description: "bar", evaluation_factor: "baz",
                   option1: "f", option2: "o", option3: "b", option4: "a")
    ])
  end

  it "renders a list of questions" do
    render
  end
end
