require 'test_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "creates a post", :t do
      expect { post :create, params: { post: { message: 'Hello World!' } } }.to change { Post.count }.by(1)
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

end
