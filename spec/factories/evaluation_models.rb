FactoryGirl.define do
  factory :evaluation_model do
    name                    { Faker::Name.name }
    sector                  { FactoryGirl.create(:sector) }
    position                { FactoryGirl.create(:position) }
  end
end
