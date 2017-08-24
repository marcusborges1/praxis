require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to belong_to(:sector) }
  it { is_expected.to have_many(:project_allocations) }
  it { is_expected.to have_many(:projects).through(:project_allocations) }
  it { is_expected.to have_many(:user_positions) }
  it { is_expected.to have_many(:positions).through(:user_positions) }
  it { is_expected.to have_many(:answer_groups).dependent(:destroy) }

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

  describe '#has_admin_privileges?' do
    let(:admin_position) { FactoryGirl.create(:position, :director) }

    before(:each) do
      @admin =  FactoryGirl.create(:user, :admin)
      @user = FactoryGirl.create(:user)
      @admin.positions << admin_position
    end

    it "returns true if user has admin privileges" do
      expect(@admin.has_admin_privileges?).to be true
    end

    it "returns if common user has admin privileges" do
      expect(@user.has_admin_privileges?).to be false
    end
  end

  describe "#monitors" do
    before(:each) do
      advisor_position = FactoryGirl.create(:position, :advisor)
      organizational_presidency = FactoryGirl.create(:sector, :organizational_presidency)
      @people_management_member = FactoryGirl.create(:user, :people_management, positions: [advisor_position])
      @organizational_presidency_members = FactoryGirl.create_pair(:user, sector: organizational_presidency, positions: [advisor_position])
    end

    context "when user belongs to people management sector" do
      it "returns advisors of organizational presidency" do
        expect(@people_management_member.monitors).to match_array(@organizational_presidency_members)
      end
    end

    context "when user does not belongs to people management sector" do
      it "returns advisors of people management sector" do
        expect(@organizational_presidency_members.first.monitors).to contain_exactly(@people_management_member)
      end
    end
  end
end
