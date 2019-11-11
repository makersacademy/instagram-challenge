require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #front" do
    it "returns http success" do
      get :front
      expect(response).to have_http_status(:success)
    end
  end

end
