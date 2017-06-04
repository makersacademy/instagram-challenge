require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  include Devise::TestHelpers

  let(:user) { create :user }

  describe "Get /new" do
    it "responds" do
      user = create(:user)
      sign_in(user)
      get :new
      expect(response).to have_http_status(200)
    end
  end

end
