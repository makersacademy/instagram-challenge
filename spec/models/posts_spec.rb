require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "creates a post with a caption and image" do
    post = Post.create(caption: "petticoat lane #london", image: "spec/files/images/petticoatlane.jpg")
    expect(Post.find(1).caption).to eq "petticoat lane #london"
    expect(Post.find(1).image).to eq "spec/files/images/petticoatlane.jpg"
  end


  it "cannot be created without an image" do
    post = Post.create(caption: "no image")
    expect(Post.all.count).to eq 0
  end
end
