require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /signup" do
    it "returns http success" do
      get "/signup"
      expect(response).to have_http_status(:success)
    end
  end

end
