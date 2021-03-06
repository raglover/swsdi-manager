require 'spec_helper'
require 'requests_helper'

describe "CampApplicationPage", type: :feature do
  let(:user) { FactoryBot.create(:complete_user) }
  let(:camp) { FactoryBot.create(:camp) }

  context "GET /camp_application/id" do
    
    it "Shows the user's application information" do
      login_as(user, scope: :user)
      app = FactoryBot.create(:camp_application, user: user, camp: camp)
      visit(camp_application_path(app))
      expect(page).to have_content app.camper_type
    end
  end

end