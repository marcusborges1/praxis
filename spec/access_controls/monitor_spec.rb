require 'rails_helper'
require 'cancan/matchers'

RSpec.describe 'Monitor' do

  it 'can read accompanied reports' do
    expect(@ability).to be_able_to(:individual_report, Evaluation, evaluation_model: { sector_id: @sector.id })
  end
end
