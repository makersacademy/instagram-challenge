describe TagsHelper do
  let(:photo) { create(:photo) }
  let(:tag) { create(:tag, text: "dangermouse") }

  before do
    photo.tags << create(:tag)
    photo.tags << tag
  end

  describe "#all_tags_to_string" do
    it "outputs all tags on a photo as one string" do
      expect(all_tags_to_string(photo)).to eq "catsofynstagram dangermouse"
    end
  end
end
