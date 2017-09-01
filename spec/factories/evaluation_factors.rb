FactoryGirl.define do
  factory :evaluation_factor do
    name                    { Faker::Name.name }
    question            { FactoryGirl.create(:question) }
  end
end
