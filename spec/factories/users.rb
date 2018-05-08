require 'faker'


FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name}
    email { Faker::Internet.email }
    gender 'Female'
    parent_email { Faker::Internet.email }
    password '12345678'
    password_confirmation '12345678'

    trait :male do
      gender 'Male'
    end

    trait :unspecified_gender do
      gender 'Unspecified'
    end

    trait :fifteen do
      birthday { 15.years.ago }
    end

    trait :sixteen do
      birthday { 16.years.ago }
    end

    trait :seventeen do
      birthday { 17.years.ago }
    end

    trait :eighteen do
      birthday { 18.years.ago }
    end

    trait :school do
      school "McClintock High School"
    end

    trait :address do
      address_line1 { Faker::Address.street_address }
      address_line2 { Faker::Address.secondary_address }
      city { Faker::Address.city }
      state { Faker::Address.state }
      zip { Faker::Address.zip_code }
    end

    trait :phone_number do
      phone_number { Faker::PhoneNumber.phone_number }
    end

    trait :spirit_animal do
      spirit_animal { Faker::Team.creature }
    end

    trait :parent do
      parent_first { Faker::Name.first_name }
      parent_last { Faker::Name.last_name }
      parent_relationship 'Mother'
      parent_phone { Faker::PhoneNumber.phone_number }
    end

    trait :coach do
      coach_first { Faker::Name.first_name }
      coach_last { Faker::Name.last_name }
      coach_email { Faker::Internet.email }
    end

    factory :complete_user, traits: [:address, :phone_number, :school, :spirit_animal, :parent, 
              :coach, :sixteen]
    factory :complete_male_user, traits: [:male, :address, :phone_number, :spirit_animal, 
              :parent, :coach, :sixteen]

  end
end