require 'rails_helper'

RSpec.describe Post, type: :model do
  

  it "is not valid without valid attributes" do
    post = Post.new
    expect(post.save).to be_falsey
  end

  it "is not valid without a description" do
    post = Post.new(likes: 1)
    expect(post.save).to be_falsey
  end

  it "is valid with a description" do
    post = Post.new(description: "test")
    post.save
    expect(post.description).to eq("test")
  end

  # How to test adding an image? it is not in the post model

end
