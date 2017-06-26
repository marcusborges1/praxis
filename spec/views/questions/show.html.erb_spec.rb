require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(name: "foo", description: "bar", evaluation_factor: "baz"))
  end

  it "renders attributes in <p>" do
    render
  end
end
