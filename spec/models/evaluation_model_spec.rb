require 'rails_helper'

RSpec.describe EvaluationModel, type: :model do
  it { is_expected.to belong_to(:sector) }
  it { is_expected.to belong_to(:project) }
  it { is_expected.to have_many(:question_values).dependent(:destroy) }
  it { is_expected.to accept_nested_attributes_for(:question_values) }

  it { is_expected.to define_enum_for(:context).with([:sector, :project, :user]) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:context) }

  let(:evaluation_model) { FactoryGirl.build(:evaluation_model, sector: nil, project: nil) }
  let(:project) { FactoryGirl.build(:project) }
  let(:sector) { FactoryGirl.build(:sector)}

  it "is not valid without a target" do
    expect(evaluation_model).to_not be_valid
  end

  it "is valid with a project as target" do
    evaluation_model.project = project
    expect(evaluation_model).to be_valid
  end

  it "is valid with a sector as target" do
    evaluation_model.sector = sector
    expect(evaluation_model).to be_valid
  end

  describe "#target" do
    it "returns the right project in a project context" do
      evaluation_model.project = project
      evaluation_model.context = "project"
      expect(evaluation_model.target).to eq project
    end

    it "returns the right sector in a sector context" do
      evaluation_model.sector = sector
      evaluation_model.context = "sector"
      expect(evaluation_model.target).to eq sector
    end
  end
end
