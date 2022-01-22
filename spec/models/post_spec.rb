require 'rails_helper'

RSpec.describe Post, type: :model do
  it "should be able to store a caption" do
    post = Post.new(caption: "My breakfast", user_id: 1)
    post.save
    expect(post.caption).to eq "My breakfast"
  end

  it "should be able to take an attachment" do
    post = Post.new(caption: "My breakfast", user_id: 1)
    post.photo.attach(io: File.open("/Users/kimmorgan/Desktop/food_pic.jpeg"), filename: "food_pic.jpg", content_type: "image/jpeg")
    expect(post.photo.attached?).to be true
  end

  it "must be linked to a user" do
    post = Post.new(caption: "My breakfast")
    expect(post.valid?).to be false
  end

  it "must have an attachment" do
    user = User.new(name: "Kim", email: "kim@gmail.com", username: "kim_morgan", password: "password", password_confirmation: "password")
    user.save
    post = Post.new(caption: "My breakfast", user_id: user.id)
    expect(post.valid?).to be false
  end

  it "is valid with valid attributes" do
    user = User.new(name: "Kim", email: "kim@gmail.com", username: "kim_morgan", password: "password", password_confirmation: "password")
    user.save
    post = Post.new(caption: "My breakfast", user_id: user.id)
    post.photo.attach(io: File.open("/Users/kimmorgan/Desktop/food_pic.jpeg"), filename: "food_pic.jpg", content_type: "image/jpeg")
    expect(post.valid?).to be true
  end

end
