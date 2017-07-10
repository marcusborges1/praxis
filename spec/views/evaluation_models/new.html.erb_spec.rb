require 'rails_helper'

RSpec.describe "evaluation_models/new", type: :view do
  before(:each) do
    @questions = assign(:questions, Question.all)
    @evaluation_model = assign(:evaluation_models, EvaluationModel.new())
  end

  it "renders new evaluation_model form" do
    render
    assert_select "form[action=?][method=?]", evaluation_models_path, "post" do
      assert_select "input#evaluation_model_name[name=?]", "evaluation_model[name]"
    end
  end
end
