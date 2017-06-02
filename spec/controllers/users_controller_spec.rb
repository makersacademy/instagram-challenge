require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "GET #show" do
    it "responds with 200" do
      user = create(:user)
      sign_in(user)
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
    end
  end

end
