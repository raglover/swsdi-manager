require 'spec_helper'

describe Camp do
  it "has a valid factory" do
    camp = FactoryGirl.create(:camp)
    expect(camp).to be_valid
  end

  it "has a name" do
    camp = FactoryGirl.build(:camp, name: nil)
    expect(camp).not_to be_valid
  end

  it "has a location" do
    camp = FactoryGirl.build(:camp, location: nil)
    expect(camp).not_to be_valid
  end

  it "has a start date at some point in the future" do
    camp = FactoryGirl.build(:camp, start_date: '2014-05-24 00:00:00')
    expect(camp).not_to be_valid
  end

  it "has an end date on or after the start date" do
    #Probably want to refactor this into two tests.
    camp1 = FactoryGirl.build(:camp, start_date: '2014-06-24 00:00:00', end_date: '2014-06-23 00:00:00')
    camp2 = FactoryGirl.build(:camp, start_date: '2014-06-24 00:00:00', end_date: '2014-06-24 00:00:00')
    expect(camp1).not_to be_valid
    expect(camp2).to be_valid
  end

  it "has an application start date before the camp start date" do
    camp = FactoryGirl.build(:camp, start_date: '2014-06-24 00:00:00', app_start_date: '2014-06-24 00:00:00')
    expect(camp).not_to be_valid
  end

  it "has an application end date before the camp start date" do
    camp = FactoryGirl.build(:camp, start_date: '2014-06-24 00:00:00', app_end_date: '2014-06-25 00:00:00')
    expect(camp).not_to be_valid
  end

  it "has an application end date on or after the application start date" do
    camp = FactoryGirl.build(:camp, app_start_date: '2014-05-20', app_end_date:'2014-05-19')
    expect(camp).not_to be_valid
  end

  it "returns an array of camps that are open for registration" do
    open_camp = FactoryGirl.create(:camp) 
    closed_camp = FactoryGirl.create(:camp, app_start_date: '2014-06-01 00:00:00' )
    expect(Camp.registration_open).to include(open_camp)
    expect(Camp.registration_open).not_to include(closed_camp)
  end

end