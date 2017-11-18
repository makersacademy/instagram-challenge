require 'rails_helper'

RSpec.describe "Pins", type: :request do
  describe "GET /pins" do
    it "works! (now write some real specs)" do
      get pins_path
      expect(response).to have_http_status(200)
    end
  end
end
