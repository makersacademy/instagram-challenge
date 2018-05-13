require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  it "has no pictures by default" do
    expect(Post.count).to eq 0
  end

  it "does not save without a user" do
    picture = Post.create({title: 'http://www.example.com'})
    picture.save
    expect(Post.count).to eq 0
  end

  it "saves a valid post" do
    user = User.create(email: 'example@example', password: 123456)
    picture = Post.create({title: 'http://www.example.com', user: user})
    picture.save
    expect(Post.count).to eq 1
  end
end
