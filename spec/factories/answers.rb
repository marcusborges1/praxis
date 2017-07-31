FactoryGirl.define do
  factory :answer do
    question_value            { FactoryGirl.create(:question_value) }
    option                    { FactoryGirl.create(:option) }
    answer_group              { FactoryGirl.create(:answer_group) }
  end
end
