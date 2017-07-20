FactoryGirl.define do
  factory :position do
    name      { Faker::Company.profession }
    context   :institutional
    factory :project_position do
      context :project
    end
  end
end
