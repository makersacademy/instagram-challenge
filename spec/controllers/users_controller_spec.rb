require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new'do
    it 'returns http success' do
      get :new

      expect(response).to have_http_status(:success)
    end
  end

  context 'when invalid params' do
    let(:invalid_params) { {full_name: "Marius Brad", username: "mbrad26", email: "email", password: "123"} }
    let(:valid_session) { {} }

    it 'redirects to registration page' do
      post :create, params: {user: invalid_params}, session: valid_session

      expect(response.location).to eq "http://test.host/users/new"
    end
  end
end
