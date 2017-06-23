require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {
    Question.new(name: "foo", description: "bar", evaluation_factor: "baz")
  }

  it "is expected to be valid" do
    expect(question).to be_valid
  end

  it "is not valid without name" do
    question.name = nil
    expect(question).to_not be_valid
  end

  it "is not valid without a description" do
    question.description = nil
    expect(question).to_not be_valid
  end

  it "is not valid without a evaluation_factor" do
    question.evaluation_factor = nil
    expect(question).to_not be_valid
  end
end
