require 'rails_helper'

RSpec.describe "evaluations/show", type: :view do
  before(:each) do
    @evaluation = assign(:evaluation, Evaluation.create!(
      :evaluation_model => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
