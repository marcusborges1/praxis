require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to belong_to(:sector) }
  it { is_expected.to have_many(:project_allocations) }
  it { is_expected.to have_many(:projects).through(:project_allocations) }
  it { is_expected.to have_many(:user_positions) }
  it { is_expected.to have_many(:positions).through(:user_positions) }
  it { is_expected.to have_many(:answer_groups).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:name) }

  describe '#is_director?' do
    let(:director_position) { FactoryGirl.create(:position, name: 'Diretor') }
    let(:advisor_position) { FactoryGirl.create(:position, name: 'Assessor') }
    let(:user) { FactoryGirl.create(:user, positions: [director_position]) }

    it 'returns true when the user is a director' do
      expect(user.is_director?).to be true
    end

    it 'returns false if the user is not a director' do
      user.positions = [advisor_position]
      expect(user.is_director?).to be false
    end
  end

  describe '#is_advisor?' do
    let(:advisor_position) { FactoryGirl.create(:position, name: 'Assessor') }
    let(:director_position) { FactoryGirl.create(:position, name: 'Diretor') }
    let(:user) { FactoryGirl.create(:user, positions: [advisor_position]) }

    it 'returns true when the user is an advisor' do
      expect(user.is_advisor?).to be true
    end

    it 'returns false if the user is not an advisor' do
      user.positions = [director_position]
      expect(user.is_advisor?).to be false
    end
  end

  describe '#is_manager?' do
    let(:manager_position) { FactoryGirl.create(:position, name: 'Gerente') }
    let(:advisor_position) { FactoryGirl.create(:position, name: 'Assessor') }
    let(:user) { FactoryGirl.create(:user, positions: [manager_position]) }

    it 'returns true when the user is a manager' do
      expect(user.is_manager?).to be true
    end

    it 'returns false if the user is not a manager' do
      user.positions = [advisor_position]
      expect(user.is_manager?).to be false
    end
  end

  describe '#is_president?' do
    let(:president_position) { FactoryGirl.create(:position, name: 'Presidente') }
    let(:advisor_position) { FactoryGirl.create(:position, name: 'Assessor') }
    let(:user) { FactoryGirl.create(:user, positions: [president_position]) }

    it 'returns true when the user is a president' do
      expect(user.is_president?).to be true
    end

    it 'returns false if the user is not a president' do
      user.positions = [advisor_position]
      expect(user.is_president?).to be false
    end
  end

  describe '#is_monitor?' do
    let(:people_management) { FactoryGirl.create(:sector, name: 'GP') }
    let(:organizational_presidency) { FactoryGirl.create(:sector, name: 'PRESORG') }
    let(:people_management_member) { FactoryGirl.create(:user, sector: people_management) }
    let(:organizational_presidency_member) { FactoryGirl.create(:user, sector: organizational_presidency) }
    let(:user) { FactoryGirl.create(:user) }

    it 'returns true when the user is a monitor' do
      expect(people_management_member.is_monitor?).to be true
    end

    it 'returns false if the user is not a monitor' do
      expect(organizational_presidency_member.is_monitor?).to be true
    end

    it 'returns false if the user is not a monitor' do
      expect(user.is_monitor?).to be false
    end
  end

  describe '#has_admin_privileges?' do
    let(:admin_position) { FactoryGirl.create(:position, :director) }

    before(:each) do
      @admin = FactoryGirl.create(:user, :admin)
      @user = FactoryGirl.create(:user)
      @admin.positions << admin_position
    end

    it 'returns true if user has admin privileges' do
      expect(@admin.has_admin_privileges?).to be true
    end

    it 'returns false if common user has admin privileges' do
      expect(@user.has_admin_privileges?).to be false
    end
  end

  describe '#monitors' do
    before(:each) do
      @users = FactoryGirl.create_list(:user, 2)
      @people_management = FactoryGirl.create(:sector, name: 'GP')
      @people_management_member = FactoryGirl.create(:user, sector: @people_management)
    end

    it 'returns members monitored by user' do
      @users.map { |user| user.update(monitor: @people_management_member) }
      expect(@people_management_member.monitored.count).to eq(2)
    end
  end
end
