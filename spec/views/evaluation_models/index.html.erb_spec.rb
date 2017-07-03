require 'rails_helper'

RSpec.describe "evaluation_models/index", type: :view do
  before(:each) do
    position = assign(:position, Position.create(name: "Position"))
    sector = assign(:sector, Sector.create!(name: "DAF"))
    assign(:evaluation_models, [
      EvaluationModel.create!(
        :name => "Name",
        :sector_id => sector.id,
        :position_id => position.id
      ),
      EvaluationModel.create!(
        :name => "Name",
        :sector_id => sector.id,
        :position_id => position.id
      )
    ])
  end

  xit "renders a list of evaluation_models" do
    render
  end
end
