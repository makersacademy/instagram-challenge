require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe "GET /" do
    it "redirects to the login page" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end
end