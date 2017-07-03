require 'rails_helper'

RSpec.describe "evaluations/new", type: :view do
  before(:each) do
    @evaluation = assign(:evaluation, Evaluation.new(
      :start_date => nil,
      :finish_date => nil,
      :evaluation_model => nil,
    ))
  end

  xit "renders new evaluation form" do
    render

    assert_select "form[action=?][method=?]", evaluations_path, "post" do

      assert_select "input#evaluation_evaluation_model_id[name=?]", "evaluation[evaluation_model_id]"
    end
  end
end
