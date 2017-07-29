require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to belong_to(:sector) }
  it { is_expected.to have_many(:project_allocations) }
  it { is_expected.to have_many(:projects).through(:project_allocations) }
  it { is_expected.to have_many(:user_positions) }
  it { is_expected.to have_many(:positions).through(:user_positions) }

  it { is_expected.to validate_presence_of(:name) }

  describe "#has_position?(position)" do
    let(:right_position) { FactoryGirl.create(:position, name: "Diretor") }
    let(:wrong_position) { FactoryGirl.create(:position, name: "Assessor") }
    let(:user) { FactoryGirl.create(:user, positions: [right_position]) }

    it "returns true when the user has that position" do
      expect(user.has_position? right_position).to be true
    end

    it "returns false if the user does not have that position" do
      expect(user.has_position? wrong_position).to be false
    end
  end
end
