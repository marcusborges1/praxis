require 'rails_helper'

RSpec.describe "evaluations/show", type: :view do
  before(:each) do
    @evaluation = assign(:evaluation, FactoryGirl.create(:evaluation))
  end

  it "renders attributes in <p>" do
    render
  end
end
