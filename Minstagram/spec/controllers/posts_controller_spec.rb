require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "After signing in" do
    it "user is redirected to posts page" do
      user = User.create(user_name: 'testUser', email: 'test@test.com', password: "password", password_confirmation: "password")
      sign_in user

      get :index
      expect(response).to have_http_status(200)

      sign_out user
    end
  end

  describe "If not signed in" do
    it "use can't vew the posts page" do
      get :index
      expect(response).to have_http_status(302)
    end
  end

  describe "After signing in" do
    it "user can't save new posts without pictures" do
      user = User.create(user_name: 'testUser', email: 'test@test.com', password: "password", password_confirmation: "password")
      sign_in user

      post :create, params: { post: { message: "Hello, world!",  } }
      expect(response).to redirect_to(posts_url)
      expect(Post.find_by(message: "Hello, world!")).not_to be

      sign_out user
    end
  end
end
