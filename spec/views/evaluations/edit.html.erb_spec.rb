require 'rails_helper'

RSpec.describe "evaluations/edit", type: :view do
  before(:each) do
    @evaluation = assign(:evaluation, Evaluation.create!(
      :evaluation_model => nil
    ))
  end

  it "renders the edit evaluation form" do
    render

    assert_select "form[action=?][method=?]", evaluation_path(@evaluation), "post" do

      assert_select "input#evaluation_evaluation_model_id[name=?]", "evaluation[evaluation_model_id]"
    end
  end
end
