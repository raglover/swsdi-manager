# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tenant do
    user_id 1
    room_id 1
    length_of_stay 1
  end
end
