# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "redirects the user to posts index after successful sign in" do
      user = FactoryBot.create(:user)
      post :create, params: { email: user.email, password: user.password }
      expect(response).to redirect_to posts_url
    end

    it "redirects renders the sign in template again if unsuccessful sign in" do
      user = FactoryBot.build(:user)
      post :create, params: { email: user.email, password: user.password }
      expect(response).to render_template "new"
    end
  end

  describe "GET #destroy" do
    it "redirects to posts index after sign out" do
      user = FactoryBot.build(:user)
      delete :destroy, session: { id: user.id }
      expect(response).to redirect_to posts_url
    end
  end
end
