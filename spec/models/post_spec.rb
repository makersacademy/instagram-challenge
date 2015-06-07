require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }
  it { is_expected.to belong_to :user }

  it 'is not valid without an image' do
    post = described_class.new(title: 'Aw')
    expect(post).to have(1).error_on(:image)
    expect(post).not_to be_valid
  end

  describe 'comments' do
    describe 'build_with_user' do
      let(:user) { User.create email: 'test@test.com', username: 'testuser', password: 'testpassword' }
      let(:post) { Post.create title: 'Awesome' }
      let(:comment_params) { { text: 'This is a comment' } }

      subject(:comment) { post.comments.build_with_user(comment_params, user) }

      it 'builds a review' do
        expect(comment).to be_a Comment
      end

      it 'builds a review associated with the specified user' do
        expect(comment.user).to eq user
      end
    end
  end

  describe 'likes' do
    describe 'build_with_user' do

      let(:user) { User.create email: 'test@test.com', username: 'testuser', password: 'testpassword' }
      let(:post) { Post.create title: 'Awesome' }

      subject(:like) { post.likes.build_with_user(user) }

      it 'builds a review' do
        expect(like).to be_a Like
      end

      it 'builds a review associated with the specified user' do
        expect(like.user).to eq user
      end
    end
  end

end
