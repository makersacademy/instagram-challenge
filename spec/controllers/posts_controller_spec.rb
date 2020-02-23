require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET /index' do
    it 'responds with 302' do
      get :index
      expect(response).to have_http_status 302
    end
  end
end
