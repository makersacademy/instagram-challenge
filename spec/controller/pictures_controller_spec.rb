require 'rails_helper'

RSpec.describe PicturesController, type: :controller do
  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /pictures/new" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
