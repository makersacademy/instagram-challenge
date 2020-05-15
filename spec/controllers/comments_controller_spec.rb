require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  login_user

  let(:user) { User.first }
  let(:picture) { create(:picture, user: user) }
  let(:comment_attributes) { { text: 'this is a comment', picture_id: picture.id } }

  describe 'POST /' do
    before do
      post :create, params: { comment: comment_attributes }
    end

    it 'responds with 200' do
      expect(response).to redirect_to(pictures_path)
    end

    it 'creates a post' do
      expect(Comment.find_by(text: 'this is a comment')).to be
    end
  end

  describe 'DELETE /destroy' do
    let(:comment) { create(:comment, picture: picture, user: user) }

    it 'responds with 200' do
      delete :destroy, params: { id: comment.id }
      expect(response).to redirect_to(pictures_path)
    end
  end
end
