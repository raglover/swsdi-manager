
FactoryGirl.define do
  factory :user do
    first_name 'Test'
    last_name 'Testerton'
    gender 'Male'
    sequence(:email) { |n| 'test#{n}@test.com'}
    sequence(:parent_email) { |n| 'parent#{n}@test.com'}
    password '12345678'
    password_confirmation '12345678'
  end
end