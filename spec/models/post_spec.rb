require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'posts have pictures and captions' do
    user = User.create(username: "User Name", email: "test@example.com",
                       password: "my_secret")
    post = Post.new :image => File.new(Rails.root + 'spec/support/IMG_0655.JPG')
    post.caption = 'test photo'
    post.user_id = user.id
    post.save
    expect(post).to be_valid
  end

  it 'posts have pictures, no captions' do
    user = User.create(username: "User Name", email: "test@example.com",
                       password: "my_secret")
    post = Post.new :image => File.new(Rails.root + 'spec/support/IMG_0655.JPG')
    post.user_id = user.id
    post.save
    expect(post).to be_valid
  end

  it 'posts cannot have captions without image' do
    user = User.create(username: "User Name", email: "test@example.com",
                       password: "my_secret")
    post = Post.create(caption: 'Test')
    post.user_id = user.id
    expect(post).to_not be_valid
  end

  it 'posts cannot save without user' do
    post = Post.new :image => File.new(Rails.root + 'spec/support/IMG_0655.JPG')
    expect(post).to_not be_valid
  end
end
