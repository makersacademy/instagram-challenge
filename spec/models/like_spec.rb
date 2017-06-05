require 'rails_helper'

RSpec.describe Like, type: :model do

  let(:user) { User.create(name: "Admin", username: "Admin", email: "test@example.com", password: "password") }
  let(:post) { Post.create(caption: "post message", image: basic_image, user_id: user.id) }
  let(:like) { Like.create(post_id: post.id, user_id: user.id) }

  it 'can be created with user id' do
    expect(like.user_id).to eq user.id
    expect(like.id).not_to be_nil
  end

  it 'can be created with post id' do
    expect(like.post_id).to eq post.id
  end
end
