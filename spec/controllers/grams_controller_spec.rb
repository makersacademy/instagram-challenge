require 'rails_helper'

RSpec.describe GramsController, type: :controller do
  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "Get /grams/new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
  end
end
