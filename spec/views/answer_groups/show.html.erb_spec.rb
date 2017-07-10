require 'rails_helper'

RSpec.describe "answer_groups/show", type: :view do
  before(:each) do
    @answer_group = assign(:answer_group, FactoryGirl.create(:answer_group))
  end

  it "renders attributes in <p>" do
    render
  end
end
