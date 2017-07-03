require 'rails_helper'
require 'date'

RSpec.describe "evaluations/edit", type: :view do
  before(:each) do
    position = assign(:position, Position.create(name: "Position"))
    sector = assign(:sector, Sector.create!(name: "DAF"))
    evaluation_model = assign(:evaluation_models, [
      EvaluationModel.create!(
        :name => "My String",
        :sector_id => sector.id,
        :position_id => position.id
      )
    ])
    @evaluation = assign(:evaluation, Evaluation.create!(
      :start_date => Date.today,
      :finish_date => Date.tomorrow,
      :evaluation_model => evaluation_model
    ))
  end

  xit "renders the edit evaluation form" do
    render

    assert_select "form[action=?][method=?]", evaluation_path(@evaluation), "post" do

      assert_select "input#evaluation_evaluation_model_id[name=?]", "evaluation[evaluation_model_id]"
    end
  end
end
