json.array!(@camp_applications) do |camp_application|
  json.extract! camp_application, :id
  json.url camp_application_url(camp_application, format: :json)
end
