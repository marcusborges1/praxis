require 'rails_helper'

RSpec.describe EvaluationModel, type: :model do
  it "should have one target sector" do
    association = EvaluationModel.reflect_on_association(:sector)
    expect(association.macro).to eq :belongs_to
  end

  it "should have one target position" do
    association = EvaluationModel.reflect_on_association(:position)
    expect(association.macro).to eq :belongs_to
  end

  xit { should validate_presence_of(position_ids:[]), skip: "Because of reasons"}
  xit { should validate_presence_of(:name) }
  xit { should have_many(:questions) }
end
