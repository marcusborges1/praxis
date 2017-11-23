require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to have_many(:project_allocations) }
  it { is_expected.to have_many(:evaluation_models) }
  it { is_expected.to have_many(:users).through(:project_allocations) }
  it { is_expected.to belong_to(:leader).class_name('User') }
  it { is_expected.to belong_to(:manager).class_name('User') }
  it { is_expected.to validate_presence_of(:name) }
end
