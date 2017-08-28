FactoryGirl.define do
  factory :evaluation_cycle do
    initial_date  { DateTime.now }
    end_date      { initial_date.next_month }

    trait :in_progress do
    end

    trait :finished do
      end_date { DateTime.now }
      initial_date { end_date.last_week }
    end
  end
end
