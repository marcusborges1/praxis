require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, FactoryGirl.create_list(:question, 2))
  end

  it "renders a list of questions" do
    render
  end
end
