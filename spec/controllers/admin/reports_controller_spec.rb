require 'rails_helper'

RSpec.describe Admin::ReportsController, :type => :controller do

  describe "GET financial" do
    it "returns http success" do
      get :financial
      expect(response).to be_success
    end
  end

  describe "GET shuttle" do
    it "returns http success" do
      get :shuttle
      expect(response).to be_success
    end
  end

  describe "GET status" do
    it "returns http success" do
      get :status
      expect(response).to be_success
    end
  end

end
