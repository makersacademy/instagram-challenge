require 'rails_helper'

RSpec.describe Api::V1::AuthsController, type: :controller do
  describe 'POST /auth' do
    scenario 'it returns an invalid credential error' do
      post :create, params: { email: 'wrong@user.com', password: 'incorrect' }
      expect(response.parsed_body['error']).to eq [{ "invalid" => "Invalid credentials" }]

    end

    scenario 'it returns an authentication token' do
      User.create(email: 'user@email.com', password: 'password')
      post :create, params: { email: 'user@email.com', password: 'password' }

      expect(response.parsed_body['token'].length.zero?).to be false
    end
  end
end
