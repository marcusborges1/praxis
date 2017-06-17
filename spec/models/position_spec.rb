require 'rails_helper'

RSpec.describe Position, type: :model do
  let(:position) {Position.new(name: "Position")}

  it "is valid with valid attributes" do
    expect(position).to be_valid
  end

  it "is invalid when name is nil" do
    position.name = nil
    expect(position).not_to be_valid
  end
end
