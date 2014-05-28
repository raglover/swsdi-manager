require 'spec_helper'
require 'requests_helper'

describe "UserProfilePage" do
  
  let(:user) { FactoryGirl.create(:user) }

  context "the user's avatar" do
    it "displays a default avatar if none is set." do
      login_valid(user)
      visit profile_path(user)
      expect(page.find('#userpanel img')['src']).to have_content('thumb_default.png')
    end

    it "displays the user's facebook avatar if oauth provider is facebook" do
      fb_user = FactoryGirl.create(:user, provider: 'facebook', fb_image: 'https://www.facebook.com/thisisanimage')
      login_valid fb_user
      visit profile_path(fb_user)
      expect(page.find('#userpanel img')['src']).to have_content('facebook')
    end

    xit "displays the user's uploaded avatar image if they have one" do
      # TODO: Come back and test this with other Carrierwave tests, later on.
      # avatar_user = FactoryGirl.create(:user, image: 'testimage.jpg')
      # login_valid avatar_user
      # visit profile_path(avatar_user)
      # expect(page.find('#userpanel img')['src']).to have_content('testimage.jpg')
    end
  end

  it "shows the user's contact information" 
  it "shows the user's personal information"
  it "shows the parent contact information"
  it "shows the coach's contact information"
  it "allows users to register for open camps"
  it "shows the user their registrations"
  it "allows users to edit their own registrations"
  it "shows the user their registration acceptance status"
  it "allows users to edit their own profile information"
  it "allows users to change their own password"
end