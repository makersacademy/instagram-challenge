require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      user = User.create(name: "Admin", username: "User", email: "admin@test.com", password: "password")
      post :create, params: { post: { caption: "Hello", image: "World!", user_id: user.id } }
      expect(response).to redirect_to(posts_url)
    end
  end
end
