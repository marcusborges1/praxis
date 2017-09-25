FactoryGirl.define do
  factory :user do
    name                    { Faker::Name.name }
    email                   { Faker::Internet.email }
    password                "123qwe!@#"
    password_confirmation   "123qwe!@#"
    sector
    positions               { FactoryGirl.create_list(:position, 1) }
  end

  trait :people_management do
    association :sector, :people_management
  end

  trait :organizational_presidency do
    association :sector, :organizational_presidency
  end

  trait :admin do
    association :sector, :people_management
  end
end
