require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to belong_to(:sector) }
  it { is_expected.to have_many(:project_allocations) }
  it { is_expected.to have_many(:projects).through(:project_allocations) }
  it { is_expected.to have_many(:user_positions) }
  it { is_expected.to have_many(:positions).through(:user_positions) }

  it { is_expected.to validate_presence_of(:name) }

  let(:user) { FactoryGirl.create(:user) }
  it 'boolean return of user position' do
    expect(user.is_position?(user.positions.first)).to eq(true)
  end

end
