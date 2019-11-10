require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  before :each do
    User.create(email: 'test@rspec.com', password: 'password')
    @key = AuthenticateUserCommand.call('test@rspec.com', 'password').result
  end

  describe 'GET /' do
    it 'returns 401 if no token is provided' do
      get :show
      expect(response).to have_http_status(401) 
    end
    it 'returns 200 when authenticated' do
      get :show, params: {token: @key}
    end
  end
end
