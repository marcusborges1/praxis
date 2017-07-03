require 'rails_helper'

RSpec.describe "evaluation_models/new", type: :view do
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

  skip "renders new evaluation_model form" do
    render

    assert_select "form[action=?][method=?]", evaluation_models_path, "post" do

      assert_select "input#evaluation_model_name[name=?]", "evaluation_model[name]"
    end
  end
end
