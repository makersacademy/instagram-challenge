require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  login_user

  let(:user) { User.first }
  let(:picture) { create(:picture, user: user) }
  let(:comment_attributes) { { text: 'this is a comment', picture_id: picture.id } }

  describe 'POST /:picture_id/comments' do
    before do
      post :create, { params: { comment: comment_attributes, picture_id: picture.id } }
    end

    it 'responds with 302' do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(picture)
    end

    it 'creates a post' do
      expect(Comment.find_by(text: 'this is a comment')).to be
    end
  end

  describe 'DELETE /destroy' do
    let(:comment) { create(:comment, picture: picture, user: user) }

    it 'responds with 302' do
      delete :destroy, params: { picture_id: picture.id, id: comment.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(picture)
    end
  end

end
