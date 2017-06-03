require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'can be created with user id and post id' do
    user = User.create(name: "Admin", username: "Admin", email: "test@example.com", password: "password")
    post = Post.create(caption: "post message", user_id: user.id)
    like = Like.create(post_id: post.id, user_id: user.id)
    expect(like.user_id).to eq user.id
    expect(like.post_id).to eq post.id
    expect(like.id).not_to be_nil
  end
end
