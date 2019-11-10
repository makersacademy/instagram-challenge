require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  before :each do
    @user = User.create(email: 'test@rspec.com', password: 'password')
    @post = Post.create(caption: 'A caption', url: 'https://www.google.com', user_id: @user.id)
    @key = AuthenticateUserCommand.call('test@rspec.com', 'password').result
  end

  describe 'GET /' do
    it 'returns 401 if no token is provided' do
      get :show
      expect(response).to have_http_status(401) 
    end
    
    it 'returns 200 when authenticated' do
      my_headers = { 
        "ACCEPT": "application/json",
        "Authorisation": @key
      }
      request.headers.merge!(my_headers)
      get :show
      
      expect(response).to have_http_status(200) 
    end

    it 'returns a JSON of post entries' do
      my_headers = { 
        "ACCEPT": "application/json",
        "Authorisation": @key
      }
      request.headers.merge!(my_headers)
      get :show

      response_body = JSON.parse(response.body)

      expect(response_body['posts'].first).to include 'id'
      expect(response_body['posts'].first).to include 'caption'
      expect(response_body['posts'].first).to include('user_id')
    end
  end
end
