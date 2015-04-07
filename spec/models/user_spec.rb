require 'spec_helper'

describe User, type: :model do  
  it 'knows if its already liked a post' do
    user = User.create(email: "anothertest@test.com", password: "testtest")
    post = Post.create(title: "Burger Queen", user: user)
    like = Like.create(post: post, user: user)
    expect(user.has_liked?(post)).to eq(true)
  end  
end   