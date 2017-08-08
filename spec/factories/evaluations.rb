FactoryGirl.define do
  factory :evaluation do
    name                    { Faker::Name.name }
    start_date              { Faker::Date.between(3.days.ago, Date.today) }
    finish_date             { Faker::Date.between(2.days.ago, Date.tomorrow) }
    evaluation_model        { FactoryGirl.create(:evaluation_model) }
  end
end
