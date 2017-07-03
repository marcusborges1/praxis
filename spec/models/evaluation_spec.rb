require 'rails_helper'
require 'date'

RSpec.describe Evaluation, type: :model do
  let(:sector) { Sector.create!(name: "Setor 1") }
  let(:position) { Position.create!(name: "Cargo 1") }
  let(:evaluation_model) { EvaluationModel.create!(name: "Modelo 1", sector_id: sector.id, position_id: position.id) }
  let(:evaluation) { Evaluation.new( start_date: Date.today, finish_date: Date.tomorrow, evaluation_model_id: evaluation_model) }

  it "should belong to one evaluation model" do
    association = Evaluation.reflect_on_association(:evaluation_model)
    expect(association.macro).to eq :belongs_to
  end

  it "should validate presence of start date" do
    evaluation.start_date = nil
    expect(evaluation).not_to be_valid
  end

  it "should validate presence of finish date" do
    evaluation.finish_date = nil
    expect(evaluation).not_to be_valid
  end

  it "evaluation should not be valid" do
    evaluation.start_date, evaluation.finish_date = Date.tomorrow, Date.today
    expect(evaluation).not_to be_valid
  end


  xit { should belong_to(:evaluation_model) }
  xit { should validate_presence_of(:start_date) }
  xit { should validate_presence_of(:finish_date) }
end
