require 'rails_helper'

RSpec.describe PublicController, type: :controller do
  describe 'GET /homepage' do
    it "responds with 200" do
      get :homepage
      expect(response).to have_http_status(200)
    end
  end
end
