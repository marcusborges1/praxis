FactoryGirl.define do
  factory :question do
    sequence(:description)         { |n| "description #{n}"  }
    sequence(:evaluation_factor)   { |n| "evalution factor #{n}" }
  end
end
