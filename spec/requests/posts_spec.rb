require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:users) { create_list(:user, 10) }
  let!(:posts) { create_list(:post, 10) }
  let(:post_id) { posts.first.id }

  describe "GET /posts" do
    before { get "/posts" }

    it "returns http 200" do
      expect(response).to have_http_status(200)
    end

    it "returns all posts" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end

  describe "POST /posts" do
    let(:valid_attributes) { {image: 'http://imageawesome.com/image',
                              user_id: '1', 
                              description: 'This is an awesome image'} }

    before { post "/posts", params: valid_attributes}
      
    context "when the request is valid" do
      it "creates a new post" do
        expect(json['image']).to eq('http://imageawesome.com/image')
      end

      it "returns http 201" do
        expect(response).to have_http_status(201)
      end
    end
    
    context "when the request is invalid" do
      before { post '/posts', params: { image: '' } }

      it "returns http 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body).to match(/Validation failed: Image can't be blank/)
      end
    end
  end

  describe "GET /posts/:id" do
    before { get "/posts/#{post_id}" }

    context 'when the post exists' do
      it 'returns the post' do
        expect(json).to_not be_empty
        expect(json['id']).to eq(post_id)
      end

      it 'returns http 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the post does not exist' do
      let(:post_id) { 100 }

      it 'returns http 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post with 'id'=100/)
      end
    end
  end

  describe 'PUT /post/:id' do
    let(:valid_attributes) { { description: 'Maybe this image is not so good' } }
    before { put "/posts/#{post_id}", params: valid_attributes }

    context 'when the record exists' do

      it 'updates the record' do
        expect(json['description']).to eq('Maybe this image is not so good')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /posts/:id' do
    before { delete "/posts/#{post_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
