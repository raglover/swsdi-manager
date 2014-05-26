FactoryGirl.define do
  factory :camp do
    sequence(:name) {|n| "Test Camp #{n}"}
    location "Pretenious Honors College"
    start_date '2014-07-06 00:00:00'
    end_date '2014-07-20 00:00:00'
    app_start_date '2014-05-01 00:00:00'
    app_end_date '2014-06-20 00:00:00'
    active true
  end
end