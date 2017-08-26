require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  describe "GET #new" do
    before do
      user = double('user')
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
