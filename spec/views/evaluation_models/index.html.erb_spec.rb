require 'rails_helper'

RSpec.describe "evaluation_models/index", type: :view do
  before(:each) do
    assign(:evaluation_models, [
      EvaluationModel.create!(
        :name => "Name"
      ),
      EvaluationModel.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of evaluation_models" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
