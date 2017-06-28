require 'rails_helper'

RSpec.describe "evaluation_models/new", type: :view do
  before(:each) do
    assign(:evaluation_model, EvaluationModel.new(
      :name => "MyString"
    ))
  end

  it "renders new evaluation_model form" do
    render

    assert_select "form[action=?][method=?]", evaluation_models_path, "post" do

      assert_select "input#evaluation_model_name[name=?]", "evaluation_model[name]"
    end
  end
end
