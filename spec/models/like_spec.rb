require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:like) { described_class.new(number: 1, post_id: 10, user_id: 32)}
  subject(:no_like) { described_class.new(number: 1)}

  context "Unsucessful like" do
    it "when no 'post_id' present" do
      expect(no_like).to_not be_valid
    end

    it "when no 'user_id' present" do
      expect(no_like).to_not be_valid
    end
  end

  context "Successful comment" do
    it "contains a number" do
      expect(like.number).to eq(1)
    end

    it "contains a 'post_id'" do
      expect(like.post_id).to be(10)
    end

    it "contains a 'user_id'." do
      expect(like.user_id).to be(32)
    end
  end
end
