require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Comments have text, user and post ids' do
    user = User.create(username: "User Name", email: "test@example.com",
                       password: "my_secret")
    post = Post.create(image: File.new(Rails.root + 'spec/support/IMG_0655.JPG'), caption: 'test photo', user_id: user.id)
    comment = Comment.new(comment: 'test comment', user_id: user.id, post_id: post.id)
    expect(comment).to be_valid
  end
end
