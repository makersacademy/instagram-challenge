require 'rails_helper'

RSpec.describe Post do
  subject(:post) {described_class.new(description: "Amazing day", user_id: 2)}

  context "Unsuccessful post creation" do
    it "without a 'description'" do
      post = Post.new(description: nil, user_id: 1)
      expect(post).to_not be_valid
    end

    it "without a 'user_id'" do
      post = Post.new(description: "Great day", user_id: nil)
      expect(post).to_not be_valid
    end
  end

  context "Successful post creation" do
    it "has a 'description'" do
      expect(post.description).to eq("Amazing day")
    end

    it "has a 'user_id'" do
      expect(post.user_id).to be(2)
    end
  end

end
