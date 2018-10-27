require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'GET #landing' do
    it 'returns http success' do
      get :landing
      expect(response).to have_http_status(:success)
    end
  end
end
