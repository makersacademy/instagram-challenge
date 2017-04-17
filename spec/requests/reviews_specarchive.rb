require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe "GET /reviews" do
    it "works! (now write some real specs)" do
      get reviews_path
      expect(response).to have_http_status(200)
    end
  end
end
