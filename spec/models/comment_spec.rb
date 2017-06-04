require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:user) { User.create(name: "Admin", username: "MrAdmin", email: "test@example.com", password: "password") }
  let(:post) { Post.create(caption: "post message", image: "dog.jpg", user_id: user.id) }

  it 'can be created with a post id and user id' do
    comment = Comment.create(body: "A comment", post_id: post.id, user_id: user.id)
    expect(comment.post_id).to eq post.id
    expect(comment.user_id).to eq user.id
    expect(comment.body).to eq("A comment")
    expect(comment.user.name).to eq("Admin")
    expect(comment).to be_valid
  end

  it 'Cannot be empty' do
    comment = Comment.create(body: " ", post_id: post.id, user_id: user.id)
    expect(comment).to_not be_valid
  end

  it 'Cannot be shorter than 2 characters' do
    comment = Comment.create(body: "X", post_id: post.id, user_id: user.id)
    expect(comment).to_not be_valid
  end

  it 'Cannot be longer than 150 characters' do
    comment = Comment.create(
                      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, qu",
                      post_id: post.id,
                      user_id: user.id
                      )
    expect(comment).to_not be_valid
  end
end
