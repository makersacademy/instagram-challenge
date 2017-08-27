describe User do
  subject(:user) { create(:user) }

  it "deletes associated photos on destruction" do
    create(:photo, user: user)
    user.destroy
    expect(Photo.count).to eq 0
  end

  it "deletes associated comments on destruction" do
    photo = create(:photo, user: create(:user, email: "penfold@mouse.com"))
    create(:comment, user: user, photo: photo)
    user.destroy
    expect(Comment.count).to eq 0
  end

  it "deletes associated likes on destruction" do
    photo = create(:photo, user: create(:user, email: "colonel@mouse.com"))
    create(:like, user: user, photo: photo)
    user.destroy
    expect(Like.count).to eq 0
  end

  it "deletes follower associations on destruction" do
    followee = create(:user, email: "penfold@mouse.com")
    followee.followers << user
    user.destroy
    expect(followee.followers.count).to eq 0
  end

  describe "#to_param" do
    it "returns a User's username" do
      expect(user.to_param).to eq "dangermouse"
    end
  end
end
