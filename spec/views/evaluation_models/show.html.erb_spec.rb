require 'rails_helper'

RSpec.describe "evaluation_models/show", type: :view do
  before(:each) do
    @evaluation_model = assign(:evaluation_model, FactoryGirl.create(:evaluation_model))
  end

  it "renders attributes in <p>" do
    render
  end
end
