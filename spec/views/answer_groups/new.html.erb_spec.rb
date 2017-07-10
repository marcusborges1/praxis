require 'rails_helper'

RSpec.describe "answer_groups/new", type: :view do
  before(:each) do
    @answer_group = assign(:answer_group, AnswerGroup.new())
  end

  it "renders new answer_group form" do
    render
  end
end
