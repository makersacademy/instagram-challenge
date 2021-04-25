require 'rails_helper'

RSpec.describe GramsController, type: :controller do
  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "Get /grams/new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "Post /grams" do
    it "redirects to the home page" do
      post :create, params: { gram: { body: "This is my first post." } }
      expect(response).to redirect_to(root_path)
    end

    it "creates a gram" do
      post :create, params: { gram: { body: "This is my first post." } }
      expect(Gram.find_by(body: "This is my first post.")).to be
    end
  end
end
