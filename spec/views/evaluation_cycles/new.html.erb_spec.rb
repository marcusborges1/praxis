require 'rails_helper'

RSpec.describe "evaluation_cycles/new", type: :view do
  before(:each) do
    assign(:evaluation_cycle, EvaluationCycle.new())
  end

  it "renders new evaluation_cycle form" do
    render

    assert_select "form[action=?][method=?]", evaluation_cycles_path, "post" do
    end
  end
end
