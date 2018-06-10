require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  context "User is signed in" do

    before(:each) do
      @user = create(:user)
      sign_in(@user)
    end

    describe "GET /index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end

  context "User is signed out" do

    describe "Get #index" do
      it "returns http redirect" do
        get :index
        expect(response).to have_http_status(302)
      end
    end
  end

end
