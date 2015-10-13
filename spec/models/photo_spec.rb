require 'rails_helper'

RSpec.describe Photo, type: :model do

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }

  let(:user) { create(:user) }
  let(:photo) { create(:photo) }
  let(:comment_params) { { comment: 'text' } }

  describe 'build_with_user' do
    subject(:comment) { photo.comments.build_with_user(comment_params, user) }

    it 'builds a comment' do
      expect(comment).to be_a Comment
    end

    it 'builds a comment associated with the specific user' do
      expect(comment.user).to eq user
    end

  end

  describe 'create_with_user' do
    subject(:comment) { photo.comments.create_with_user(comment_params, user) }

    it 'builds a comment' do
      expect(comment).to be_a Comment
    end

    it 'create a comment associated with the specific user' do
      expect(comment.user).to eq user
    end

    it 'adds comment to database' do
      photo.comments.create_with_user(comment_params, user)
      expect(Comment.count).to eq(1)
    end
  end

  describe 'create_with_user!' do
    subject(:comment) { photo.comments.create_with_user!(comment_params, user) }

    it 'builds a comment' do
      expect(comment).to be_a Comment
    end

    it 'create a comment associated with the specific user' do
      expect(comment.user).to eq user
    end

    it 'adds comment to database' do
      photo.comments.create_with_user!(comment_params, user)
      expect(Comment.count).to eq(1)
    end
  end

end
