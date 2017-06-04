require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create :user }

  describe "GET /index " do
    it "responds with 200" do
      user = create(:user)
      sign_in(user)
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new " do
    it "responds with 200" do
      user = create(:user)
      sign_in(user)
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST / " do
    it "responds with 200" do
      user = create(:user)
      sign_in(user)
      post :create, params: { post: { body: 'Describing an image' } }
      expect(response).to redirect_to(posts_url)
    end
  end
end
