FactoryGirl.define do
  factory :project do
    name { Faker::App.name }
    factory :project_with_users do
      users { FactoryGirl.create_list(:user, 3) }
      user_ids { users.map(&:id) }
    end
  end
end
