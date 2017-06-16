require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: "name") }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is invalid when name is nil" do
    user.name = nil
    expect(user).to_not be_valid
  end
end
