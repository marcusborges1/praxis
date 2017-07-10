require 'rails_helper'

RSpec.describe "answer_groups/edit", type: :view do
  before(:each) do
    @answer_group = assign(:answer_group, FactoryGirl.create(:answer_group))
  end

  it "renders the edit answer_group form" do
    render
  end
end
