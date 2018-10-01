require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET /home' do
    it 'responds with 200' do
      get :home
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /images' do
    it 'responds with 302' do  
      get :images
      expect(response).to have_http_status(:redirect)
    end
  end
end
