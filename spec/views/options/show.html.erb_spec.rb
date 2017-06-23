require 'rails_helper'

RSpec.describe "options/show", type: :view do
  before(:each) do
    question = Question.create(name: "foo1", description: "bar1", evaluation_factor: "baz1")
    @option = assign(:option, Option.create!(description: "Description", question: question))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
