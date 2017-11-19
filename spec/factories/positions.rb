FactoryGirl.define do
  factory :position do
    name      { Faker::Company.profession }
    context   :institutional

    factory :project_position do
      context :project
    end

    trait :advisor do
      name    'Assessor'
    end

    trait :director do
      name    'Diretor'
    end
  end
end
