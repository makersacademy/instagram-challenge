require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      user = FactoryBot.create(:user)
      post :create, params: { email: user.email, password: user.password }
      expect(response).to redirect_to posts_url
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, params: { id: 1 }
      expect(response).to have_http_status(:success)
    end
  end

end
