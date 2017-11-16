FactoryGirl.define do
  factory :evaluation_model do
    name                    { Faker::Name.name }
    context                 "project" 
    sector
    project
  end
end
