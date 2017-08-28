require 'rails_helper'

RSpec.describe "evaluation_cycles/index", type: :view do
  before(:each) do
    assign(:evaluation_cycles, [
      FactoryGirl.create(:evaluation_cycle, :finished),
      FactoryGirl.create(:evaluation_cycle, :in_progress)
    ])
  end

  it "renders a list of evaluation_cycles" do
    render
  end
end
