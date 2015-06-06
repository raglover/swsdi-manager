require 'spec_helper'

describe Admin::AdminsController, type: :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get :show
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end
