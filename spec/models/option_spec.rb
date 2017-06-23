require 'rails_helper'

RSpec.describe Option, type: :model do
  let(:question) {
    Question.create(name: "foo1", description: "bar1", evaluation_factor: "baz1")
  }
  let(:option) { Option.new(description: "foo", question: question) }

  it "is valid with valid attributes" do
    expect(option).to be_valid
  end

  it "is not valid without a description" do
    option.description = nil
    expect(option).to_not be_valid
  end

  it "belongs to question" do
    association = Option.reflect_on_association(:question)
    expect(association.macro).to eq :belongs_to
  end
end
