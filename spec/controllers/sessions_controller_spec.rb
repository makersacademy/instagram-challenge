require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET /sessions/new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /sessions/" do
    it "responds with 200" do
      User.create(username: "test_user", password: "test_password")
      post :create, params: { username: "test_user", password: "test_password" }
      expect(response).to redirect_to(root_url)
    end

    it "creates a new session" do
      User.create(username: "test_user", password: "test_password")
      post :create, params: { username: "test_user", password: "test_password" }
      expect(response).to redirect_to(root_url)
    end
  end

  describe "DELETE /logout" do
    it "destroys the session" do
      User.create(username: "test_user", password: "test_password")
      post :create, params: { username: "test_user", password: "test_password" }
      get :destroy
      expect(response).to redirect_to(root_url)
    end
  end
end
