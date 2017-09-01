FactoryGirl.define do
  factory :question do
    sequence(:description)               { |n| "description #{n}"  }
  end
end
