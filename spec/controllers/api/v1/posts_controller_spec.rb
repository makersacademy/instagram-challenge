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

      expect(response_body.first).to include 'id'
      expect(response_body.first).to include 'caption'
      expect(response_body.first).to include 'user_id'
    end
  end
  
  describe 'POST / ' do
    before :each do
      my_headers = { 
        "ACCEPT": "application/json",
        "Authorisation": @key
      }
      request.headers.merge!(my_headers)
    end
    
    it 'returns 200' do
      post :create
      expect(response).to have_http_status(200)
    end
    
    it 'creates a post' do
      post :create, params: { post: { caption: 'Another Caption', url: 'https://www.google.com' } }
      expect(Post.find_by(caption: 'Another Caption')).to be_a Post
    end
    
    it 'returns the post JSON' do
      post :create, params: { post: { caption: 'Another Caption', url: 'https://www.google.com' } }
      response_body = JSON.parse(response.body)

      expect(response_body).to include 'id'
      expect(response_body).to include 'caption'
      expect(response_body).to include 'user_id'
    end
  end
end
