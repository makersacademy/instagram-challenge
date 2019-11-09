require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'POST /' do
    it 'responds with success' do
      post :create, params: { email: 'user@email.com', password: 'password' }

      expect(response.parsed_body['success']).to eq true
    end

    it 'responds with failure' do
      User.create(email: 'user@email.com', password: 'password')
      post :create, params: { email: 'user@email.com', password: 'password' }

      expect(response.parsed_body['failure']).to eq({ 'message' => 'Validation failed: Email has already been taken' })
    end

    it 'creates a user' do
      post :create, params: { email: 'user@email.com', password: 'password' }

      expect(User.first.email).to eq 'user@email.com'
    end
  end
end
