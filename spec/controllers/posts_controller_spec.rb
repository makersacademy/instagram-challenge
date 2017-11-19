require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#index' do
    it 'responds with success' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#users_posts' do
    it 'responds with success' do
      get :users_posts
      expect(response).to be_success
    end
  end
end
