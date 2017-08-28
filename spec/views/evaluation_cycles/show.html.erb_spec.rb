require 'rails_helper'

RSpec.describe "evaluation_cycles/show", type: :view do
  before(:each) do
    @evaluation_cycle = assign(:evaluation_cycle, FactoryGirl.create(:evaluation_cycle))
  end

  it "renders attributes in <p>" do
    render
  end
end
