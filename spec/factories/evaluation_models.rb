FactoryGirl.define do
  factory :evaluation_model do
    name                    { Faker::Name.name }
    sector
  end
end
