require 'rails_helper'

RSpec.describe "evaluation_models/show", type: :view do
  before(:each) do
    position = assign(:position, Position.create(name: "Position"))
    sector = assign(:sector, Sector.create!(name: "DAF"))
    @evaluation_model = assign(:evaluation_models, [
      EvaluationModel.create!(
        :name => "My String",
        :sector_id => sector.id,
        :position_id => position.id
      )
    ])
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
