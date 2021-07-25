require 'rails_helper'

RSpec.describe Post, type: :model do
  fixtures :users, :posts
  let(:user) { users(:cynthia) }
  let(:post) { user.posts.build(content: "Hello this is my first post") }

  it "should be valid" do
    expect(post).to be_valid
  end

  it "should have a user id" do
    post.user_id = nil
    expect(post).not_to be_valid
  end

  it 'should have content shorter than 140 characters' do
    post.content = "a" * 141
    expect(post).not_to be_valid
  end

  it 'should be ordered with most recent first' do
    expect(posts(:most_recent)).to eq(Post.first)
  end
end
