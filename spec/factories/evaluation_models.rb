FactoryGirl.define do
  factory :evaluation_model do
    name                    { Faker::Name.name }
    sector                  { FactoryGirl.create(:sector) }
  end
end
