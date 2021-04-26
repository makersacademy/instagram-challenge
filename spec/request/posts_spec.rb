require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do
  let!(:users) { create_list(:user, 1) } 
  let!(:posts) { create_list(:post, 10) }

  describe "GET /index" do
    before { get "/api/v1/posts/index" }

    it 'returns posts' do
      expect(json).not_to be_empty 
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    
  end

  describe "GET /show" do
    context "When the user has posts" do
      before { get "/api/v1/posts/show/1" }

      it 'returns their posts' do
        expect(json).not_to be_empty 
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end    
  end

  describe "POST /create" do
    let(:post_attributes) { {username: "taran314", description: "cute dog photo", image: "https://placedog.net/images?id=1", user_id: "1"} }
    context "When the request is valid" do
      before { post '/api/v1/posts/create', params: post_attributes}

      it 'creates a new post' do
        expect(json['username']).to eq("taran314")
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context "When the request is invalid" do
      before { post '/api/v1/posts/create', params: {} }
      
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Username can't be blank/)
      end
    end
  end

end
