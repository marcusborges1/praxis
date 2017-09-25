require 'rails_helper'

RSpec.describe "evaluation_factors/new", type: :view do
  before(:each) do
    assign(:evaluation_factor, EvaluationFactor.new())
  end

  it "renders new evaluation_factor form" do
    render

    assert_select "form[action=?][method=?]", evaluation_factors_path, "post" do
    end
  end
end
