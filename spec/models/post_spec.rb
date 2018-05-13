require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:dbl_user) { double :user, id: 1 }
  describe "#owner?" do
    it "returns true when called with its owner" do
      post = Post.create(photo: "test", desc: "wow", user_id: dbl_user.id)
      expect(post.owner?(dbl_user)).to be_truthy
    end
    it "returns false when called with another user" do
      post = Post.create(photo: "test", desc: "wow", user_id: 2)
      expect(post.owner?(dbl_user)).to be_falsey
    end
  end
end
