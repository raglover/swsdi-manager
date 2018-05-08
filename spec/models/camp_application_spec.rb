require 'spec_helper'

describe CampApplication do
  
  it "has a valid factory" do
    app = FactoryBot.build(:camp_application)
    expect(app).to be_valid
  end

  it { should have_many :debate_records }
  it { should have_many :check_out_permissions }
  it { should belong_to :user }
  it { should belong_to :camp }
  it { should have_and_belong_to_many :events }

  # describe '#has_competed' do
  #   let (:application) { FactoryBot.build :camp_application }
  #   let (:with_records) { FactoryBot.build :app_with_records }

  #   context 'has competed before' do
  #     it "should require debate records" do
  #       application.has_competed = true
  #       expect(application).not_to be_valid
  #     end

  #     it "should be valid with records" do
  #       with_records.has_competed = true
  #       expect(with_records).to be_valid
  #     end
  #   end
  # end

end