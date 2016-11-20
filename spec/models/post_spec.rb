require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "New post" do
    let(:user) { FactoryGirl.create(:user) }

  it "has a caption" do
    post = Post.create(caption: "cool photo", user_id:1)
    expect(post.caption).to eq("cool photo")
  end
end
end
