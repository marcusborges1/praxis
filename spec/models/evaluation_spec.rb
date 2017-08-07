require 'rails_helper'

RSpec.describe Evaluation, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:finish_date) }

  it { is_expected.to have_many(:answer_groups).dependent(:destroy) }
  it { is_expected.to belong_to(:evaluation_cycle) } 
  it { is_expected.to belong_to(:evaluation_model) }
end
