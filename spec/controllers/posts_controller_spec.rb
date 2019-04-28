require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "Doesn't add post to posts table if no image uploaded" do
      user = User.create({ username: 'andy', email: 'andy@tester.com', password: '123456', password_confirmation: '123456' })
      session[:user_id] = user.id
      post :create, params: { post: { caption: 'My post' } }
      expect(Post.find_by(users_id: user.id)).to eq nil
    end
    it "Doesn't add post to posts table if not logged in" do
      post :create, params: { post: { caption: 'My post' } }
      expect(Post.all).to eq []
    end
  end
end
