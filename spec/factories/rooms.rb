# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    camp_id 1
    building_name "MyString"
    room_num 1
  end
end
