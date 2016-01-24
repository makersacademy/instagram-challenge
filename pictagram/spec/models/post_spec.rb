require 'spec_helper'

describe Post, type: :model do
  it { is_expected.to have_many :comments }

  it 'is not valid with a name of less than three characters' do
    post = Post.new(comment: "M")
    expect(post).to have(1).error_on(:comment)
    expect(post).not_to be_valid
  end

  describe 'comments' do
  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com' }
    let(:post) { Post.create comment: 'Test' }
    let(:comment_params) { { comment: 'yum'} }

    subject(:comment) { post.comments.build_with_user(comment_params, user) }

    it 'builds a comment' do
      expect(comment).to be_a Comment
    end

    it 'builds a comment associated with the specified user' do
      expect(comment.user).to eq user
    end
  end
end

end
