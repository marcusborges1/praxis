FactoryGirl.define do
  factory :position do
    name      { Faker::Company.profession }
    context   { %i{institutional project}.sample }
  end
end
