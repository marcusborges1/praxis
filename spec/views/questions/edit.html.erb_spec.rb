require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(name: "foo", description: "bar", evaluation_factor: "baz",
                 option1: "f", option2: "o", option3: "b", option4: "a"))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do
    end
  end
end
