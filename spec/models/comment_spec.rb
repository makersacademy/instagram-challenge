require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { described_class.new(body: "Great day! Wow! Fantastic!!!", post_id: 10, user_id: 32)}
  subject(:no_comment) { described_class.new(body: "Great day! or Awful?")}

  context "Unsucessful comment" do
    it "when no 'post_id' present" do
      expect(no_comment).to_not be_valid
    end

    it "when no 'user_id' present" do
      expect(no_comment).to_not be_valid
    end
  end

  context "Successful comment" do
    it "contains a body" do
      expect(comment.body).to eq('Great day! Wow! Fantastic!!!')
    end

    it "contains a 'post_id'" do
      expect(comment.post_id).to be(10)
    end

    it "contains a 'user_id'." do
      expect(comment.user_id).to be(32)
    end
  end
end
