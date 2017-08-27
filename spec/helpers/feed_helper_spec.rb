describe FeedHelper do
  describe "#following_photos" do
    let(:dangermouse) { create(:user) }
    let(:penfold) { create(:user, email: "penfold@mouse.com", username: "penfold") }

    before do
      dangermouse.followers << penfold
    end

    it "returns a collection of photos belonging to those a user follows" do
      photo = create(:photo, user: dangermouse)
      expect(following_photos(penfold)).to include photo
    end
  end
end
