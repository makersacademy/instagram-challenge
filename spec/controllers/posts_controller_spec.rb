# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before :each do
    current_user = FactoryBot.create(:user)
    login_as(current_user, scope: :user)
  end

  describe 'GET /new ' do
    it 'responds with 302' do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end
  end

  # it 'creates a post' do
  #   user = User.all[0]
  #   Post.create(title: 'Hello, world!', image: 'image')
  #   expect(Post.find_by(message: 'Hello, world!')).to be
# end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
