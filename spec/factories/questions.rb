FactoryGirl.define do
  factory :question do
    sequence(:description)               { |n| "description #{n}"  }
    sequence(:evaluation_factor)         { |n| "evaluation_factor #{n}"  }
  end
end
