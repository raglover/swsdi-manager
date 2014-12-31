FactoryGirl.define do

  factory :event do 
    name Faker::Lorem.word
    price_resident 1060
    price_commuter 880
    description Faker::Lorem.sentence(word_count = 10)
  end
  
  factory :camp_session do
    sequence(:name) {|n| "Session #{n}"}
    sequence(:shortname) {|n| "#{n}"}
    session_start 4.weeks.from_now
    session_end 6.weeks.from_now

    events {
      Array(2..5).sample.times.map do
        FactoryGirl.create(:event)
      end
    }
  end

  factory :camp do
    sequence(:name) {|n| "Test Camp #{n}"}
    location "Pretenious Honors College"
    start_date 4.weeks.since
    end_date 6.weeks.since
    app_start_date 1.week.ago
    app_end_date 3.weeks.since
    active true

    after(:create) do |camp, evaluator|
      create(:camp_session, session_start: evaluator.start_date, 
        session_end: evaluator.end_date, camp: camp)
      create(:camp_session, session_start: evaluator.start_date, 
        session_end: evaluator.start_date + 1.week, camp: camp)
      create(:camp_session, session_start: evaluator.start_date + 1.week, 
        session_end: evaluator.end_date, camp: camp)
    end
  end


end