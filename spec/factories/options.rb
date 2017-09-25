FactoryGirl.define do
  factory :option do
    description  { Faker::Lorem.sentence }
    weight       1.0
    question
  end
end
