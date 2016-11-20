require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "New post" do
    let(:user) { FactoryGirl.create(:user) }

    it "has a comment" do
      post = Post.create(caption: "cool photo", user_id:1)
      comment = Comment.create(text: "sick", user_id:1, post_id:1)
      expect(comment.text).to eq "sick"
    end
  end
end
