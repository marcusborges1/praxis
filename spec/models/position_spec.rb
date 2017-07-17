require 'rails_helper'

RSpec.describe Position, type: :model do
  it { is_expected.to have_many(:user_positions) }
  it { is_expected.to have_many(:users).through(:user_positions) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:context) }
  it { is_expected.to define_enum_for(:context) }
end
