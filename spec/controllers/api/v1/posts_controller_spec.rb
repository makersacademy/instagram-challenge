require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  # before :each do
  #   key = AuthenticateUserCommand.call(*params.slice(:email, :password).values)
  # end

  describe 'GET /' do
    it 'returns 401 if no token is provided' do
      get :show
      expect(response).to have_http_status(401) 
    end
  end
end
