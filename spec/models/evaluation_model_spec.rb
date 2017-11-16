require 'rails_helper'

RSpec.describe EvaluationModel, type: :model do
  it { is_expected.to belong_to(:sector) }
  it { is_expected.to belong_to(:project) }
  it { is_expected.to have_many(:question_values).dependent(:destroy) }
  it { is_expected.to accept_nested_attributes_for(:question_values) }

  it { is_expected.to define_enum_for(:context).with([:sector, :project, :user]) }
  it { is_expected.to validate_presence_of(:name) }
end
