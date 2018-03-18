require 'rails_helper'

RSpec.describe PicturesController, type: :controller do

  describe "GET pictures#new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
