FactoryGirl.define do
  factory :sector do
    name     "DAF"

    trait :people_management do
      name   "GP"
    end

    trait :organizational_presidency do
      name   "PRESORG"
    end
  end
end
