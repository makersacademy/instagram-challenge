require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET /create' do
    it 'responds with 302' do
      get :create
      expect(response).to have_http_status 302
    end
  end
end
