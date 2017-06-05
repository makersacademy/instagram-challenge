require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:user) { User.create(name: "Name", username: "User", email: "test@example.com",
  password: "my_secret") }

  it 'cannot be created without a user' do
    post = Post.create(caption: 'post message', image: basic_image)
    expect(post).to_not be_valid
  end

  it 'can be created without a caption' do
    post = Post.create(image: basic_image, user_id: user.id)
    expect(post).to be_valid
  end

  it 'cannot be created without an image' do
    post = Post.create(caption: 'post message', user_id: user.id)
    expect(post).to_not be_valid
  end

  it 'belongs to a user' do
    post = Post.create(caption: 'post message', image: basic_image, user_id: user.id)
    expect(post.user).to eq user
  end
end
