require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET /new' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    before(:each) do
      @user_params = {first_name: 'Tess', 
                      last_name: 'Tester', 
                      email: 'tess@tester.com', 
                      password: 'secure'}
      User.create(@user_params)
      @session_params = { email: 'tess@tester.com', password: 'secure' }
    end

    describe 'when email and password match existing account' do
      it 'redirects to welcome/images' do
        post :create, params: { session: @session_params }
        expect(response).to redirect_to(welcome_images_url) 
      end

      it 'adds user.id to the session' do
        post :create, params: { session: @session_params }
        expect(session[:user_id]).to be
      end
    end

    describe 'when email and password do not match existing account' do
      it 'redirects to new session' do
        post :create, params: { session: { email: 'unregistered@account.com', password: 'insecure' } }
        expect(response).to redirect_to(new_session_url)
      end
    end
  end
end
