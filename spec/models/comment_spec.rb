require "rails_helper"

describe Comment, type: :model do
  it { is_expected.to belong_to :photo }

  it { is_expected.to belong_to :user }

  describe "#created_by?" do
    it "returns true if the user created the comment" do
      user = FactoryGirl.create(:user)
      comment = FactoryGirl.create(:comment, user: user)
      expect(comment.created_by?(user)).to eq true
    end
  end
end
