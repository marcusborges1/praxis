require 'rails_helper'

RSpec.describe Question, type: :model do
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:evaluation_factor) }
  it { is_expected.to have_many(:options) }
end
