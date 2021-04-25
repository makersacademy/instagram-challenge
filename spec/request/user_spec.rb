require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # creates the list of users and save to database (!)
  let!(:users) {create_list(:user, 10) } 
  let(:user_id) { users.first.id }
  let(:username) { users.first.username }
  let(:password) { users.first.password }

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

  describe 'GET /users/:id' do
    before { get "/api/v1/users/show/#{user_id}" }
    
    context "When the user exists" do

      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context "When the user does not exist" do
      let(:user_id) { 10000000 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns not found message" do
        expect(response.body).to match(/Couldn't find User/)
      end
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

  describe 'GET /users/authenticate' do
    
    context "When the request is valid" do
      before { get "/api/v1/users/authenticate/#{username}/#{password}" }
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context "When the request is invalid" do
      let(:username) { "fake_username" }
      let(:password) { "fake_password" }
      before { get "/api/v1/users/authenticate/#{username}/#{password}" }

      it 'returns nil' do
        expect(json).to eq(nil)
      end

      it 'returns' do
        expect(response.body).to eq("")
      end
    end
  end
end

# curl -v POST -H "Content-Type: application/json" -d '{"forename":"Sadie", "lastname":"Smith", "username":"ssmith", "password":"password1"}' http://localhost:3000/api/v1/users/create