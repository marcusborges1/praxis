require 'rails_helper'

RSpec.describe "evaluation_models/show", type: :view do
  before(:each) do
    @evaluation_model = assign(:evaluation_model, EvaluationModel.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
