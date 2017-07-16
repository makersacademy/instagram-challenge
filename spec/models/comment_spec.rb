require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to be }

  it 'returns the user username' do
    user = create(:user)
    post = create(:post)
    comment = Comment.create(post_id: post.id, user_id: user.id, message: "test")
    expect(comment.author_username).to eq user.username
  end
end
