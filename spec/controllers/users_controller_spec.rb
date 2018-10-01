require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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
    end

    it 'responds with 200' do
      post :create, params: { users: @user_params}
      expect(response).to redirect_to(welcome_home_url)
    end
    it 'creates a user account' do
      post :create, params: { users: @user_params}
      expect(User.find_by(email: 'tess@tester.com')).to be
    end
  end
end
