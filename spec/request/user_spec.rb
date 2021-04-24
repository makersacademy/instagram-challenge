require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # creates the list of users and save to database (!)
  let!(:users) {create_list(:user, 10) } 

  describe 'GET /users' do
    before { get '/api/v1/users/index' }

    it 'returns users' do
      expect(json).not_to be_empty # expects some response content
      expect(json.size).to eq(10)
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /users' do
    # valid user information
    let(:valid_attributes) { {username: "taran314", password: "password123", forename: "Tarandeep", lastname: "Nandhra"} }
    context "When the request is valid" do
      before { post '/api/v1/users/create', params: valid_attributes}

      it 'creates a new user' do
        expect(json['username']).to eq("taran314")
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context "When the request is invalid" do
      before { post '/api/v1/users/create', params: {} }
      
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Username can't be blank/)
      end
    end
  end
end

# curl -v POST -H "Content-Type: application/json" -d '{"forename":"Sadie", "lastname":"Smith", "username":"ssmith", "password":"password1"}' http://localhost:3000/api/v1/users/create