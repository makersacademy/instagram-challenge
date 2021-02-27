# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  login_user

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
