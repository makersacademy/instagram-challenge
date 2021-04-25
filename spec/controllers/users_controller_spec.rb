require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /users/new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    it "redirects to root on succesful sign up" do
      post :create, params: { user: { username: "test_user", password: "test_password" } }
      expect(response).to redirect_to(root_url)
    end

    it "creates a user" do
      post :create, params: { user: { username: "test_user", password: "test_password" } }
      expect(User.find_by(username: "test_user")).to be
    end
  end
end
