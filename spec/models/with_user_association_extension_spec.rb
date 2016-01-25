require 'rails_helper'

describe WithUserAssociationExtension do
  let!(:user) { create(:user) }
  let!(:picture) { create(:picture) }
  let!(:comment_params) { { content: 'comment' } }

  describe '#create_with_user' do
    subject(:comment) { picture.comments.create_with_user(user, comment_params) }
    it 'creates a specified model object' do
      expect(comment).to be_a Comment
    end
    it 'saves the model object' do
      expect(comment.id).not_to be nil
    end
    it 'creates a specified model object associated with the specified user' do
      expect(comment.user).to eq user
    end
  end

  describe '#build_with_user' do
    let!(:comment_params) { { content: 'comment' } }
    subject(:comment) { picture.comments.build_with_user(user, comment_params) }
    it 'builds a specified model object' do
      expect(comment).to be_a Comment
    end
    it 'does not save the model object' do
      expect(comment.id).to be nil
    end
    it 'builds a specified model object associated with the specified user' do
      expect(comment.user).to eq user
    end
  end
end
