require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET /index' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status 200
    end
  end
end