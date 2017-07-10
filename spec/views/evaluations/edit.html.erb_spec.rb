require 'rails_helper'

RSpec.describe "evaluations/edit", type: :view do
  before(:each) do
    @evaluation = assign(:evaluation, FactoryGirl.create(:evaluation))
  end

  it "renders the edit evaluation form" do
    render
  end
end
