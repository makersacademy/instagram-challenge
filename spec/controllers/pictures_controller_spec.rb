require 'rails_helper'

RSpec.describe PicturesController, type: :controller do
  login_user

  let(:valid_attributes) { { :image => 'http://image.com', :user_id => User.first.id } }
  let(:valid_session) { {} }

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    before do
      post :create, params: { picture: valid_attributes }
    end

    it 'responds with 200' do
      expect(response).to redirect_to(pictures_url)
    end

    it 'creates a post' do
      expect(Picture.find_by(:image => 'http://image.com')).to be
    end
  end

  describe 'DELETE /destroy' do
    let(:picture) { create(:picture, user: User.first) }

    it 'responds with 200' do
      delete :destroy, params: { id: picture.id }
      expect(response).to redirect_to(pictures_url)
    end
  end
end
