require 'rails_helper'

RSpec.describe EvaluationModel, type: :model do
  xit { should validate_presence_of(position_ids:[]), skip: "Because of reasons"}
  xit { should validate_presence_of(:name) }
  xit { should have_many(:questions) }
end
