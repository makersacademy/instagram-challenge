require 'rails_helper'

RSpec.describe "Nameds", type: :request do
  describe "GET /nameds" do
    it "works! (now write some real specs)" do
      get nameds_path
      expect(response).to have_http_status(200)
    end
  end
end
