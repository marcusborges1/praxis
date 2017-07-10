require 'rails_helper'

RSpec.describe "evaluations/new", type: :view do
  before(:each) do
    @evaluation_models = assign(:evaluation_models, EvaluationModel.all)
    @evaluation = assign(:evaluation, Evaluation.new())
  end

  it "renders new evaluation form" do
    render
  end
end
