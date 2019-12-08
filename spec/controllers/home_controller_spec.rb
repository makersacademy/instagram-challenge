require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET / ' do
    scenario 'responds 200' do
      get :index

      expect(response).to have_http_status(200)
    end
  end
end
