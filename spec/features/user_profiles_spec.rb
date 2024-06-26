require 'spec_helper'
require 'requests_helper'

describe "UserProfilePage", type: :feature do
  
  let(:user) { FactoryBot.create(:complete_user) }
  before(:each) do
    FactoryBot.create(:camp)
    login_valid(user)
    visit profile_path(user)
  end

  context "the user's avatar" do

    it "displays a default avatar if none is set." do
      expect(page.find('#userpanel img')['src']).to have_content('thumb_default.png')
    end

    it "displays the user's facebook avatar if oauth provider is facebook" do
      click_on "Log Out"
      fb_user = FactoryBot.create(:complete_user, provider: 'facebook', fb_image: 'https://www.facebook.com/thisisanimage')
      login_valid fb_user
      visit profile_path(fb_user)
      expect(page.find('#userpanel img')['src']).to have_content('facebook')
    end

    # xit "displays the user's uploaded avatar image if they have one" do
    #   # TODO: Come back and test this with other Carrierwave tests, later on.
    #   # avatar_user = FactoryBot.create(:user, image: 'testimage.jpg')
    #   # login_valid avatar_user
    #   # visit profile_path(avatar_user)
    #   # expect(page.find('#userpanel img')['src']).to have_content('testimage.jpg')
    # end
  end
  
  context "the users profile" do
  
    it "shows the user's contact information" do
      expect(page).to have_content(user.address_line1)
    end
  
    it "shows the user's personal information" do
      expect(page).to have_content(user.tshirt_size.upcase)
    end

    it "shows the parent contact information" do
      expect(page).to have_content(user.parent_phone)
    end

    it "shows the coach's contact information" do
      expect(page).to have_content(user.coach_email)
    end

    it "allows users to edit their own profile information" do
      click_link "Edit My Profile"
      fill_in "Your Favorite Musical Artist", with: "Taylor Swift"
      within 'form#edit_user' do
        click_on('Update')
      end
      expect(page).to have_content("Taylor Swift")
    end

    it "allows normal users to change their own password" do
      click_link "Edit My Profile"
      fill_in "Current Password", with: user.password
      fill_in "New Password", with: "newpassword"
      fill_in "Verify Password", with: "newpassword"
      within 'form#edit_user' do
        click_on('Update')
      end
      expect(page).to have_content("You updated your account successfully")
    end

    it "does not allow users to view other user profiles" do
      other_user = FactoryBot.create(:complete_user)
      visit profile_path(other_user)
      expect(page).to have_content("You are not authorized to view that resource")
    end
  
    describe "allows users to register for open camps" do
      before(:each) do
        first(:link, "Apply").click
        first(".check_boxes").click
        select 'Yes', from: "Competed Previously"
        select 'Yes', from: "Include Breakfast?"
        select 'Commuter', from: "Resident (Deadline passed) or Commuter?"
        fill_in 'Roommate Preference', with: "#{Faker::Name.name}"
        fill_in 'Tournament name', with: "Jim Fountain Classic"
        fill_in 'Location', with: "McClintock High School"
        select 'Varsity', from: "Division"
        fill_in 'W', with: 3
        fill_in 'L', with: 1
        select "Yes", from: "Outrounds"
        select "Finals", from: "Latest"
        fill_in "First name", with: "#{Faker::Name.first_name}"
        fill_in "Last name", with: "#{Faker::Name.last_name}"
        fill_in "Relationship", with: "Mother"
        fill_in "Phone num", with: "#{Faker::PhoneNumber.phone_number}"
        select "No", from: "Do you have any allergies?"
        select "No", from: "Do you have any dietary restrictions?"
        click_on "Create Camp application"
      end
      
      it "shows the user their registrations" do
        expect(page).to have_selector("i.fa-gavel")
      end

      it "shows the user their registration acceptance status" do 
        expect(page).to have_selector("i.fa-times-circle")
      end

     it "allows users to edit their own registrations" do  
        click_on "edit"
        select "No", from: "Include Breakfast?"
        click_button "Update Camp application"
        expect(page).to have_content("Camp application was successfully updated!")
      end

      it "allows users to view their registration information" do
        find("a.view_app").click
        expect(page).to have_content("Application for")
      end
    end
  end
end