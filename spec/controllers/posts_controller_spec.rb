require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let!(:user_post) { create(:post, user_id: user.id) }

  let(:user) { create(:user) }

before(:all) do
  FactoryBot.define do
    factory :user do
      email { "test@2.com" }
      password { "password" }
    end
  end
end

before(:all) do
  FactoryBot.define do
    factory :post do
      message { 'hello world'}
    end
  end
end

  before(:each) do
    sign_in user
    user_post = create(:post, user_id: user.id)
  end

  describe 'GET #edit' do
    it 'shows the edit post page' do
        get :edit, params: { id: user_post.id }
        expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it 'shows the post page' do
        get :show, params: { id: user_post.id }
        expect(response).to have_http_status(:success)
    end
  end


  describe "GET posts/new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end


  describe "POST /" do
    it "creates a post" do
      expect{ post :create, params: { post: { message: "Hello, world!" } }}.to change{Post.count}.by(1)
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

    describe 'when edit post info is valid' do
      it 'updates the post' do
        patch :update, params: { id: user_post.id, post: { message: 'Editing my first post!'} }
        expect(user.posts.first.message).to eq 'Editing my first post!'
        expect(response).to redirect_to(user.posts.first)
      end
    end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE" do
    it 'deletes the post' do
      expect { delete :destroy, params: { id: user_post.id } }.to change{Post.count}.by(-1)
      expect(response).to redirect_to(root_url)
    end
  end
end
