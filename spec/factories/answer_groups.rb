FactoryGirl.define do
  factory :answer_group do
    evaluation        { FactoryGirl.create(:evaluation) }
    user              { FactoryGirl.create(:user) }
  end
end
