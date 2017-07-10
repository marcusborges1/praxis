require 'rails_helper'
require 'date'

RSpec.describe Evaluation, type: :model do
  let(:evaluation) { FactoryGirl.build(:evaluation)}

  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:finish_date) }

  it { should belong_to(:evaluation_model) }
end
