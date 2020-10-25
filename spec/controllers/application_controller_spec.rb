require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "GET /" do
    it "redirects to the login page when not signed in" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end
end