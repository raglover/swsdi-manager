require 'spec_helper'

describe CampApplicationsController, type: :controller do
  
  # before(:each) do    
  #  sign in with devise methods.
  # end

  describe 'GET index' do

    it 'renders the index template' do
      get :index
      expect(response).to render_template 'index'
    end

    it 'loads applications into @camp_applications' do
      FactoryGirl.create_list :camp_application, 2
      get :index
      expect(assigns(:camp_applications).count).to eq 2
    end
  end

end