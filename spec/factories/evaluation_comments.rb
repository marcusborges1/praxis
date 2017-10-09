FactoryGirl.define do
  factory :evaluation_comment do
    comment { Faker::Hobbit.quote }
    answer_group
  end
end
