require 'rails_helper'

RSpec.describe Sector, type: :model do
  it { is_expected.to have_many(:users) }
  it { is_expected.to validate_presence_of(:name) }

  xdescribe ".director" do
    let(:sector) { FactoryGirl.create(:sector) }
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
