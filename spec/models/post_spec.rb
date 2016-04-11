require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments }

  describe 'comments' do
    describe 'build_with_user' do

      let(:user) { User.create email: 'test@test.com' }
      let(:post) { Post.create title: 'Test' }
      let(:comment_params) { {body: "Excellent"} }

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
