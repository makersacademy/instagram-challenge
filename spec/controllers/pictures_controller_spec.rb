require 'rails_helper'

RSpec.describe PicturesController, type: :controller do

  context "when not signed in" do
    describe "GET /index" do
      it "is redirected" do
        get :index
        expect(response).to have_http_status(302)
      end
    end
    describe "GET /new" do
      it "is redirected" do
        get :new
        expect(response).to have_http_status(302)
      end
    end
  end

  context "when signed in" do
    before(:each) do
      user = User.create(username: "fakeUsername", email: "fake@person.com", password: "fakepassword")
      sign_in user
    end

    describe "GET /index" do
      it "is successful" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
    describe "GET /new" do
      it "is successful" do
        get :new
        expect(response).to have_http_status(200)
      end
    end
  end
end
