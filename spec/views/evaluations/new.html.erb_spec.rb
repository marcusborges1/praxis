require 'rails_helper'

RSpec.describe "evaluations/new", type: :view do
  before(:each) do
    assign(:evaluation, Evaluation.new(
      :evaluation_model => nil
    ))
  end

  it "renders new evaluation form" do
    render

    assert_select "form[action=?][method=?]", evaluations_path, "post" do

      assert_select "input#evaluation_evaluation_model_id[name=?]", "evaluation[evaluation_model_id]"
    end
  end
end
