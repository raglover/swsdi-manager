FactoryGirl.define do
  factory :camp do
    sequence(:name) {|n| "Test Camp #{n}"}
    location "Pretenious Honors College"
    start_date 4.weeks.since
    end_date 6.weeks.since
    app_start_date 1.week.ago
    app_end_date 3.weeks.since
    active true
  end
end