require "rails_helper"

describe WithUserAssociationExtension do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:photo) { FactoryGirl.create(:photo, user: user) }

  describe "#create_with_user" do
    subject(:like) { photo.likes.create_with_user(user) }

    it "creates a like object" do
      expect(like).to be_a Like
    end

    it "saves the like object" do
      expect(like.id).not_to be nil
    end

    it "associates the like object with the specified user" do
      expect(like.user).to eq user
    end
  end
end
