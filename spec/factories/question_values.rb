FactoryGirl.define do
  factory :question_value do
    evaluation_model                { FactoryGirl.create(:evaluation_model) }
    value                           { Faker::Number.between(1, 10) }
    question                        { FactoryGirl.create(:question) }
  end
end
