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
    camp = FactoryGirl.build(:camp, start_date: 1.week.ago)
    expect(camp).not_to be_valid
  end

  it "has an end date on or after the start date" do
    #Probably want to refactor this into two tests.
    camp1 = FactoryGirl.build(:camp, start_date: 2.weeks.since, end_date: 1.week.since)
    camp2 = FactoryGirl.build(:camp, start_date: 4.weeks.since, end_date: 4.weeks.since)
    expect(camp1).not_to be_valid
    expect(camp2).to be_valid
  end

  it "has an application start date before the camp start date" do
    camp = FactoryGirl.build(:camp, start_date: 2.weeks.since, app_start_date: 2.weeks.since)
    expect(camp).not_to be_valid
  end

  it "has an application end date before the camp start date" do
    camp = FactoryGirl.build(:camp, start_date: 2.weeks.since, app_end_date: 2.weeks.since)
    expect(camp).not_to be_valid
  end

  it "has an application end date on or after the application start date" do
    camp = FactoryGirl.build(:camp, app_start_date: 1.week.ago, app_end_date: 2.weeks.ago)
    expect(camp).not_to be_valid
  end

  it "returns an array of camps that are open for registration" do
    #this should probably be refactored too. And it should probably check the "active" flag too.
    open_camp = FactoryGirl.create(:camp)
    closed_camp1 = FactoryGirl.create(:camp, app_start_date: 1.week.since )
    closed_camp2 = FactoryGirl.create(:camp, app_end_date: 1.week.ago )
    expect(Camp.registration_open).to include(open_camp)
    expect(Camp.registration_open).not_to include(closed_camp1)
    expect(Camp.registration_open).not_to include(closed_camp2)
  end

end