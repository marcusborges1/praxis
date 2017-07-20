FactoryGirl.define do
  factory :answer do
    question            { FactoryGirl.create(:question) }
    option              { FactoryGirl.create(:option) }
    answer_group        { FactoryGirl.create(:answer_group) }
  end
end
