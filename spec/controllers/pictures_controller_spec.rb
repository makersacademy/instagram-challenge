require 'rails_helper'

RSpec.describe PicturesController, type: :controller do

  # Return to figure out how I can test devise controllers.

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
