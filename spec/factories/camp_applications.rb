FactoryGirl.define do

  factory :camp_application do
    user
    camper_type "resident"
    has_competed false
    has_laptop true
    needs_pickup false
    needs_dropoff false
    has_allergies false
    has_dietary_restrictions false
    camp
    is_approved false
  end


end