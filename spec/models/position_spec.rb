require 'rails_helper'

RSpec.describe Position, type: :model do
  it "Position with empty name should not be valid" do
    position = Position.new(name: nil)
    expect(position).not_to be_valid
  end
end
