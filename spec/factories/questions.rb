FactoryGirl.define do
  factory :question do
    sequence(:description)               { |n| "description #{n}"  }
    evaluation_factor                    { FactoryGirl.create(:evaluation_factor) }
  end
end
