require 'rails_helper'

RSpec.describe "answer_groups/index", type: :view do
  before(:each) do
    assign(:answer_groups, FactoryGirl.create_list(:answer_group, 2))
  end

  it "renders a list of answer_groups" do
    render
  end
end
