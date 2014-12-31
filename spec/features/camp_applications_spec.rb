require 'spec_helper'
require 'requests_helper'

describe "CampApplicationPage", type: :feature do
  let(:user) { FactoryGirl.create(:complete_user) }
  before(:all) { FactoryGirl.create(:camp) }

  context "GET /camp_application/id" do
    let(:app) { FactoryGirl.create(:camp_application) }
    
    it "Shows the user's application information" do
      visit(camp_application_path(app))
      expect(page).to have_content app.camper_type
    end
  end

end