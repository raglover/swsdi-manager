require 'spec_helper'

describe CampApplication do
  
  it "has a valid factory" do
    app = FactoryGirl.build(:camp_application)
    expect(app).to be_valid
  end

end