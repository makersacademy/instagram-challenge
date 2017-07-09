require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET /new " do
    it "responds with 200" do
      sign_in
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      sign_in
      post :create, params: { post: { title: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      sign_in
      post :create, params: { post: { title: "Hello, world!" } }
      expect(Post.find_by(title: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
