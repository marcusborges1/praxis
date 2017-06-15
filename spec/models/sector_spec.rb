require 'rails_helper'

RSpec.describe Sector, type: :model do
  let(:sector) { Sector.new(name: 'Name') }

  it "is expected to be valid" do
    expect(sector).to be_valid
  end

  it "is not valid when name is nil" do
    sector.name = nil
    expect(sector).to_not be_valid
  end
end
