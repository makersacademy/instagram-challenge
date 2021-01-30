require 'rails_helper'

RSpec.describe "Pictures", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/pictures"
      expect(response).to have_http_status(:success)
    end
  end

end
