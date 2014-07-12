require 'spec_helper'
require 'requests_helper'

describe "CampApplicationPage", type: :feature do
  let(:user) { FactoryGirl.create(:complete_user) }
  before(:all) { FactoryGirl.create(:camp) }

  context "GET /user/id/camp_application" do
    let(:app) { FactoryGirl.create(:camp_application) }
    let(:page) { user_camp_application_path(:user, :app) }
    
    it "Shows the user's application information" do
      visit page
      expect(page).to have_content user.camper_type
    end
  end

end