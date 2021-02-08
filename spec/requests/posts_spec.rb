require 'rails_helper'
require_relative '../support/request_helpers'

RSpec.describe 'Posts API', type: :request do
  # Initialize test data
  # let(:users) { create_list(:user, 4) }
  # let(:posts) { create_list(:post, 10) }
  # let(:user) { users.first }
  # let(:post_id) { users.first.post.id }
  let(:user) { User.create(username: "TestUser", email: "Test@example.com", password: "password") }
  let(:user2) { User.create(username: "TestUser2", email: "Test2@example.com", password: "password") }

  before(:each) do
    @post1 = user.posts.create(caption: "My caption")
    @post1.image.attach(io: File.open('/Users/Student/Projects/weekend-challenges/instagram-challenge/spec/fixtures/files/test_image.png'), filename: 'test_image.png')
    @post2 = user.posts.create(caption: "2nd caption")
    @post2.image.attach(io: File.open('/Users/Student/Projects/weekend-challenges/instagram-challenge/spec/fixtures/files/test_image.png'), filename: 'test_image.png')
    @post3 = user2.posts.create(caption: "User2s caption")
    @post3.image.attach(io: File.open('/Users/Student/Projects/weekend-challenges/instagram-challenge/spec/fixtures/files/test_image.png'), filename: 'test_image.png')
    request_test_login(user)
  end

  describe "GET /posts_api" do
    before { get "/posts_api.json"}
    it 'returns status 200 ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns posts' do
      # json is custom helper method to parse JSON response
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end
  end

  describe "PUT /posts/:id" do
    let(:valid_attributes) { { post: { caption: "New caption" } } }

    context 'when post exists' do
      before { put "/posts/#{@post1.id}", params: valid_attributes }

      it 'updates the record' do
        # I think this might need to change?
        expect(response.body).to be_empty
      end

      it 'returns status code 204 no response needed' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /posts/:id' do
    before { delete "/posts/#{@post1.id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
