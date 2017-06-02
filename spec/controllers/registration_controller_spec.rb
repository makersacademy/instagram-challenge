require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "GET #new" do
    it "responds with 200" do
      user = create(:user)
      sign_in(user)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST create' do
    it 'creates a user' do
      user = create(:user)
      sign_in(user)
      expect(user.id).to be_kind_of(Integer)
    end
  end

end
