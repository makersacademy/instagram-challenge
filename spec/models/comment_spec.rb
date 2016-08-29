require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'build_with_user' do

    let!(:user) {User.create(email: 'test@test.com', password: 'testtest')}
    let(:post) {Post.create(caption: 'Sunset', user_id: User.first.id)}
    let(:comment_params) {{comment: 'nice'}}

    subject(:comment) {post.comments.build_with_user(comment_params, user)}

    it 'builds a comment' do
      expect(comment).to be_a(Comment)
    end

    it 'builds a comment associated with the specified user' do
      expect(comment.user).to eq(user)
    end
  end
end
