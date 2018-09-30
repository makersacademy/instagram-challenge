require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /new' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    it 'responds with 200' do
      post :create, params: { users: { first_name: 'Tess', 
                                       last_name: 'Tester', 
                                       email: 'tess@tester.com', 
                                       password: 'secure'}
                                     }
      expect(User.find_by(email: 'tess@tester.com')).to be
    end
  end
end
