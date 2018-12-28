require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "returns redirects to /posts if user created" do
      user = FactoryBot.build(:user)
      post :create, params: {
        user: {
          first_name: user.first_name,
          last_name: user.last_name,
          username: user.username,
          email: user.email,
          password: user.password
        }
      }
      expect(response).to redirect_to posts_path
    end

    it "renders 'new' again if invalid params" do
      user = FactoryBot.build(:user)
      post :create, params: {
        user: {
          first_name: user.first_name,
          last_name: user.last_name,
        }
      }
      expect(response).to redirect_to sign_up_url
    end
  end

end
