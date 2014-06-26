require 'spec_helper'

describe CampApplication do
  
  it "has a valid factory" do
    app = FactoryGirl.build(:camp_application)
    expect(app).to be_valid
  end

  it { should have_many :debate_records }

  describe '#has_competed' do
    let (:application) { FactoryGirl.build :camp_application }
    let (:with_records) { FactoryGirl.build :app_with_records }

    context 'has competed before' do
      it "should require debate records" do
        application.has_competed = true
        expect(application).not_to be_valid
      end

      it "should be valid" do
        with_records.has_competed = true
        expect(with_records).to be_valid
      end
    end

    context 'has not competed before' do
    end
  end


end