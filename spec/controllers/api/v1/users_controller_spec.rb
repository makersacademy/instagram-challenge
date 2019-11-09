require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'POST /' do
    it 'redirects to user auth' do
      post :create, params: { email: 'user@email.com', password: 'password' }
      expect(response).to have_http_status(302)
    end

    it 'creates a user' do
      post :create, params: { email: 'user@email.com', password: 'password' }

      expect(User.first.email).to eq 'user@email.com'
    end
  end
end
