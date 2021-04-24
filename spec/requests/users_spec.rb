require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  describe "GET /api/users" do
    before { get "/api/users" }

    it "returns http 200" do
      expect(response).to have_http_status(200)
    end

    it "returns all users" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end

  describe "POST /api/users" do
    let(:valid_attributes) { {forename: 'Sadie', 
                              surname: 'Smith', 
                              username: 'ssmith', 
                              email: 'ssmith@notadomain.com', 
                              password: 'password1', 
                              profile_picture: 'pic' } }

    before { post "/api/users", params: valid_attributes}
      
    context "when the request is valid" do
      it "creates a new user" do
        expect(json['forename']).to eq('Sadie')
      end

      it "returns http 201" do
        expect(response).to have_http_status(201)
      end
    end
    
    context "when the request is invalid" do
      before { post '/api/users', params: { forename: '' } }

      it "returns http 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body).to match(/Forename can't be blank/)
      end
    end
  end

  describe "GET /api/users/:id" do
    before { get "/api/users/#{user_id}" }

    context 'when the user exists' do
      it 'returns the user' do
        expect(json).to_not be_empty
        expect(json['id']).to eq(user_id)
      end

      it 'returns http 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user does not exist' do
      let(:user_id) { 100 }

      it 'returns http 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User with 'id'=100/)
      end
    end
  end

  describe 'PUT /api/users/:id' do
    let(:valid_attributes) { { surname: 'Roberts' } }
    before { put "/api/users/#{user_id}", params: valid_attributes }

    context 'when the record exists' do

      it 'updates the record' do
        expect(json['surname']).to eq('Roberts')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /api/users/:id' do
    before { delete "/api/users/#{user_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
