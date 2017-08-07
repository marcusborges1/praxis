require 'rails_helper'

RSpec.describe "evaluation_cycles/index", type: :view do
  before(:each) do
    assign(:evaluation_cycles, [
      EvaluationCycle.create!(),
      EvaluationCycle.create!()
    ])
  end

  it "renders a list of evaluation_cycles" do
    render
  end
end
