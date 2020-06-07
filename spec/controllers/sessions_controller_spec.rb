require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:user) { User.create(full_name: 'Marius Brad', username: 'mbrad26', email: 'email@example.com', password: 'password') }
    let(:valid_session) { {} }

    context 'when the password is wrong' do
      it 'redirects to "/sessions/new"' do
        invalid_params = {email: user.email, password: 'wrongpassword'}

        post :create, params: { user: invalid_params }, session: valid_session

        expect(response.location).to eq 'http://test.host/sessions/new'
      end
    end

    context 'when the email is wrong' do
      it 'redirects to "/sessions/new"' do
        invalid_params = {email: 'wrong_email@gmail.com', password: user.password}

        post :create, params: { user: invalid_params }, session: valid_session

        expect(response.location).to eq 'http://test.host/sessions/new'
      end
    end
  end
end
