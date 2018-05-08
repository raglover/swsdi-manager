FactoryBot.define do

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

  factory :app_with_records, parent: :camp_application do
    after(:build) do |app|
        app.debate_records << FactoryBot.build(:debate_record)
    end
  end

  #TODO: This should be moved to a separate factory file.
  factory :debate_record do
    tournament_name "Awesome Tournament"
  end

    
end