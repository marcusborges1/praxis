require 'rails_helper'

RSpec.describe Sector, type: :model do
  it { is_expected.to have_many(:users) }
  it { is_expected.to validate_presence_of(:name) }

  describe "#advisors" do
    let(:advisor_position) { FactoryGirl.create(:position, name: "Assessor") }
    let(:consultant_position) { FactoryGirl.create(:position, name: "Consultor") }
    let(:sector) { FactoryGirl.create(:sector) }
    let(:advisor_users) { FactoryGirl.create_list(:user, 2, sector: sector, positions: [advisor_position]) }
    let(:consultant_users) { FactoryGirl.create_list(:user, 2, sector: sector, positions: [consultant_position]) }

    it "returns the advisors of that sector" do
      expect(sector.advisors).to match_array(advisor_users)
    end

    it "does not returns non advisors of that sector" do
      expect(sector.advisors).to_not match_array(consultant_users)
    end
  end

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
