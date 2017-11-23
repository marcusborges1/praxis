FactoryGirl.define do
  factory :project do
    name        { Faker::App.name }
    leader      { FactoryGirl.create(:user) }
    manager     { FactoryGirl.create(:user) }
    factory :project_with_users do
      users { FactoryGirl.create_list(:user, 3) }
    end
  end
end
