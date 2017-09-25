require 'rails_helper'

RSpec.describe "evaluation_factors/index", type: :view do
  before(:each) do
    assign(:evaluation_factors, [
      EvaluationFactor.create!(name: "Fator"),
      EvaluationFactor.create!(name: "Fator 2")
    ])
  end

  it "renders a list of evaluation_factors" do
    render
  end
end
