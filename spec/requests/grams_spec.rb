require 'rails_helper'

RSpec.describe "Grams", type: :request do
  pending describe "GET /index" do
    it "returns http success" do
      get "/grams/index"
      expect(response).to have_http_status(:success)
    end
  end

  pending describe "GET /new" do
    it "returns http success" do
      get "/grams/new"
      expect(response).to have_http_status(:success)
    end
  end

  pending describe "GET /create" do
    it "returns http success" do
      get "/grams/create"
      expect(response).to have_http_status(:success)
    end
  end

end
