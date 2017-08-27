describe FollowersHelper do
  let(:dangermouse) { create(:user) }
  let(:penfold) { create(:user, email: "penfold@mouse.com") }
  let(:current_user) { penfold }

  before do
    dangermouse.followers << penfold
  end

  describe "#current_user_following" do
    it "determines if a user is following another user" do
      expect(current_user_following(dangermouse)).to be_truthy
    end
  end

  describe "#followings" do
    it "returns the amount of other users a user is following" do
      expect(followings(penfold)).to eq 1
    end
  end
end
