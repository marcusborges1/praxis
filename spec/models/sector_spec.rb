require 'rails_helper'

RSpec.describe Sector, type: :model do
  let(:sector) { FactoryGirl.build(:sector) }

  it "is expected to be valid" do
    expect(sector).to be_valid
  end

  it "is not valid when name is nil" do
    sector.name = nil
    expect(sector).to_not be_valid
  end

  it "has many users" do
    association = Sector.reflect_on_association(:users)
    expect(association.macro).to eq :has_many
  end

  describe ".director" do
    let(:some_position) { FactoryGirl.create(:position) }
    let(:director_position) { FactoryGirl.create(:position, name: "Diretor") }

    before(:each) do
      FactoryGirl.create_list(:user, 2, position: some_position, sector: sector)
      @director = FactoryGirl.create(:user, position: director_position, sector: sector)
    end

    it "returns the director of that sector" do
      expect(sector.director).to eq(@director)
    end
  end
end
