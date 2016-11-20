require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new when logged in" do
    let(:user) { FactoryGirl.create(:user) }

    it "returns http success" do
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new when logged out" do
    subject { get :new }

    it "redirects to #posts" do
      expect(subject).to redirect_to('/users/sign_up')
    end
  end

end
