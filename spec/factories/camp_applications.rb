FactoryBot.define do

  factory :camp_application do
    user
    camper_type {"resident"}
    has_competed {false}
    has_laptop {true}
    needs_pickup {false}
    needs_dropoff {false}
    has_allergies {false}
    has_dietary_restrictions {false}
    camp
    is_approved {false}
  end

  factory :app_with_records, parent: :camp_application do
    after(:build) do |app|
        app.debate_records << FactoryBot.build(:debate_record)
        app.check_out_permissions << FactoryBot.build(:check_out_permission)
    end
  end

  #TODO: This should be moved to a separate factory file.
  factory :debate_record do
    tournament_name {"Awesome Tournament"}
  end

  factory :check_out_permission do
    first_name {"John"}
    last_name {"Doe"}
    relationship {"Father"}
    phone_num {"555-555-5555"}
  end
    
end