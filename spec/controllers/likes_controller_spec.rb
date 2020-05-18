require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  login_user

  let(:user) { User.first }
  let(:picture) { create(:picture, user: user) }

  describe 'POST /:picture_id/likes' do
    before do
      post :create, { params: { picture_id: picture.id } }
    end

    it 'responds with 302' do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(pictures_path)
    end

    it 'creates a like' do
      expect(Like.find_by(picture_id: picture.id)).to be
    end
  end

  describe 'DELETE /destroy' do
    let(:like) { create(:like, picture: picture, user: user) }

    it 'responds with 302' do
      delete :destroy, params: { picture_id: picture.id, id: like.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(pictures_path)
    end
  end

end
