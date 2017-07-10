require 'rails_helper'

RSpec.describe "answer_groups/new", type: :view do
  before(:each) do
    @evaluation = assign(:evaluation, FactoryGirl.create(:evaluation))
    @answer_group = assign(:answer_group, AnswerGroup.new())
  end

  it "renders new answer_group form" do
    render

    assert_select "form[action=?][method=?]", answer_groups_path, "post" do

      assert_select "input#answer_group_evaluation_id[name=?]", "answer_group[evaluation_id]"
    end
  end
end
