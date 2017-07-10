require 'rails_helper'

RSpec.describe "answer_groups/edit", type: :view do
  before(:each) do
    @answer_group = assign(:answer_group, FactoryGirl.create(:answer_group))
  end

  it "renders the edit answer_group form" do
    render

    assert_select "form[action=?][method=?]", answer_group_path(@answer_group), "post" do

      assert_select "input#answer_group_evaluation_id[name=?]", "answer_group[evaluation_id]"
    end
  end
end
