FactoryGirl.define do
  factory :evaluation_cycle do
    initial_date  { DateTime.now }
    end_date      { initial_date.next_month }
  end
end
