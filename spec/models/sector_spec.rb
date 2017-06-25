require 'rails_helper'

RSpec.describe Sector, type: :model do
  let(:sector) { Sector.new(name: 'Name') }

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
    let(:some_position) { Position.create(name: "Bar") }
    let(:director_position) { Position.create(name: "Diretor") }
    before(:each) do
      User.create(name: "user1", position: some_position, sector: sector)
      User.create(name: "user2", position: some_position, sector: sector)
      @director = User.create(name: "user3", position: director_position, sector: sector)
    end

    it "returns the director of that sector" do
      expect(sector.director).to eq(@director)
    end
  end
end
