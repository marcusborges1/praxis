FactoryGirl.define do
  factory :option do
    description  { Faker::Lorem.sentence }
    question
  end
end
