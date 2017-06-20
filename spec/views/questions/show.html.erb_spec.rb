require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(name: "foo", description: "bar", evaluation_factor: "baz",
                 option1: "f", option2: "o", option3: "b", option4: "a"))
  end

  it "renders attributes in <p>" do
    render
  end
end
