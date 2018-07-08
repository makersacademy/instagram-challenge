require 'rails_helper'

RSpec.describe HomePageController, type: :controller do

  before(:each) do
    sign_in
  end

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

end
