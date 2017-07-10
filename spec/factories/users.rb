FactoryGirl.define do
  factory :user do
    name                    { Faker::Name.name }
    email                   { Faker::Internet.email }
    password                "123qwe!@#"
    password_confirmation   "123qwe!@#"
    sector                  { FactoryGirl.create(:sector) }
  end
end
