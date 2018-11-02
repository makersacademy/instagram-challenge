require 'rails_helper'

RSpec.describe PicturesController, type: :controller do

  before(:each) do
    user = User.create(username: "fakeUsername", email: "fake@person.com", password: "fakepassword")
    sign_in user
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
