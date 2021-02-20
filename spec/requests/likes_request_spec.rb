require 'rails_helper'

RSpec.describe "Likes", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/likes/new"
      expect(response).to have_http_status(:success)
    end
  end

end
