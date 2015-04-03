require 'spec_helper'

describe Post, type: :model do

  it 'initialises with 0 likes' do
    post = Post.new
    expect(post.likes).to be(0)
  end

  it 'can add a like' do
    post = Post.new
    post.add_like
    expect(post.likes).to be(1)
  end

end