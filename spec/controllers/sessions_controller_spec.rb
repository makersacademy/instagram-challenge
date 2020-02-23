require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET /index' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status 200
    end
  end

  describe 'GET /new' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status 200
    end
  end
end
