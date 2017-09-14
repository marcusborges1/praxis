require 'rails_helper'

RSpec.describe CalculateScore do
  let(:individual_score) { CalculateScore.individual_score }

  it 'expects to return value as integer' do
    expect(individual_score.class).to be(Hash)
  end

  it "expects to associate individual_score to member one member" do
    expect(individual_score[:name]).to eq("Member")
  end
end
