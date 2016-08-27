require 'rails_helper'

describe Like, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to belong_to(:post) }

  describe 'validation' do
    let(:user) { User.new }
    let(:post) { Post.new }

    it 'validates uniqueness of user scoped to post' do
      like = Like.new(post: post, user: user)
      expect(like.save).to be true
      like2 = Like.new(post: post, user: user)
      expect(like2.save).to be false
      expect(like2.errors[:user]).to include 'has liked this post already'
    end
  end
end
