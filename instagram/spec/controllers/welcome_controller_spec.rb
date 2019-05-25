require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "welcome#index" do
    it 'must return success for index page' do
      get :index 
      expect(response).to have_http_status(200)
    end
  end
end
