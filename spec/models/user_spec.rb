require 'spec_helper'

describe 'User' do
  describe "#full_name" do
    context "If the user doesn't have a nickname" do
      it "returns the full name of the user" do
        user = FactoryBot.create(:user) 
        expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
      end
    end

    context "If the user has a nickname" do
      it "returns the nickname and lastname of the user as the full name" do
        user = FactoryBot.create(:user, nickname: "Billy")
        expect(user.full_name).to eq("#{user.nickname} #{user.last_name}")
      end
    end 
  end

  describe "#age" do
    it "returns the age of the user in years." do
      user = FactoryBot.create(:user, birthday: 15.years.ago )
      expect(user.age).to eq(15)
    end
  end

  describe "a valid user" do
    it "should have a default tshirt size" do
      user = FactoryBot.create(:user)
      expect(user.tshirt_size).to eq('med')
    end

    it "should return the tshirt size the user chooses" do
      user = FactoryBot.create(:user, tshirt_size: "xxl")
      expect(user.tshirt_size).to eq('xxl')
    end

    it "rejects a user with no gender" do
      user = FactoryBot.build(:user, gender: nil)
      expect(user).not_to be_valid
    end

    it "rejects a user with no first name" do
      user = FactoryBot.build(:user, first_name: nil)
      expect(user).not_to be_valid
    end

    it "rejects a user with no last name" do
      user = FactoryBot.build(:user, last_name: nil)
      expect(user).not_to be_valid
    end

    it "rejects a user with no parent email" do
      user = FactoryBot.build(:user, parent_email: nil)
      expect(user).not_to be_valid
    end

    it "accepts a user with email, first_name, last_name, gender, parent_email, and password fields" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it "accepts a user without a password if the provider is set" do
      user = FactoryBot.create(:user, password: nil, password_confirmation: nil, provider: 'facebook')
      expect(user).to be_valid
    end

    it "rejects a user without a password if there is no omniauth provider" do
      user = FactoryBot.build(:user, password: nil, password_confirmation: nil)
      expect(user).not_to be_valid
    end
  end
end