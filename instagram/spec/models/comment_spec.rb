require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to be }

  it 'must have a body to create new instance' do
    post = Post.create(title: "This is a post with a title")
    comment = Comment.create(body: "", post: post)
    expect(comment).to_not be_valid
  end

  it 'has a body instance variable' do
    post = Post.create(title: "This is another post with a title")
    comment = Comment.create(body: "This is a body", post: post)
    expect(comment).to be_valid
  end
end
