require 'rails_helper'

RSpec.describe "evaluations/index", type: :view do
  before(:each) do
    assign(:evaluations, [
      Evaluation.create!(
        :evaluation_model => nil
      ),
      Evaluation.create!(
        :evaluation_model => nil
      )
    ])
  end

  xit "renders a list of evaluations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
