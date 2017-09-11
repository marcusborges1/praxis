require 'rails_helper'

RSpec.describe Question, type: :model do
  it { is_expected.to have_many(:options).dependent(:destroy) }
  it { is_expected.to have_many(:question_values).dependent(:destroy) }
  it { is_expected.to accept_nested_attributes_for(:options) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to belong_to(:evaluation_factor) }
end
