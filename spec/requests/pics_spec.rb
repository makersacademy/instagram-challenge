require 'rails_helper'

RSpec.describe "Pics", type: :request do
  describe "GET /pics" do
    it "works! (now write some real specs)" do
      get pics_path
      expect(response).to have_http_status(200)
    end
  end
end
