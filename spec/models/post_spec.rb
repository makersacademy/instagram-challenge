require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'cannot be created without a user' do
    post = Post.create(caption: 'post message')
    expect(post).to_not be_valid
  end

  it 'belongs to a user' do
    user = User.create(name: "Name", username: "User", email: "test@example.com",
    password: "my_secret")
    post = Post.create(caption: 'post message', image: 'dog.jpg', user_id: user.id)
    expect(post.user).to eq user
  end
end
