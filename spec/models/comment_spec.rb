require 'rails_helper'

RSpec.describe Comment, type: :model do

  user1 = User.create(email: "test@example.com", password: "123456")
  post1 = Post.create(user_id: user1.id, photo: "photo.jpg", location: "my Location", description: "random strangers")
  it "creates a comment" do
    comment = Comment.create(user_id: user1.id, post_id: post1.id, text: "poli oraio pagoto")
    expect(Comment.all.count).to eq(1)
  end
end
