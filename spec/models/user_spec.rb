require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: "name", position: position) }
  let(:position) { Position.create(name: "Diretor") }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is invalid when name is nil" do
    user.name = nil
    expect(user).to_not be_valid
  end

  it "has one position" do
    association = User.reflect_on_association(:position)
    expect(association.macro).to eq :belongs_to
  end
end
