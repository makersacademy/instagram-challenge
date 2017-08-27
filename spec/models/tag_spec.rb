describe Tag do
  let(:photo) { create(:photo) }
  subject(:tag) { described_class.new }

  it "is invalid without text" do
    tag.photos << photo
    expect(tag).not_to be_valid
  end

  it "is invalid if the text contains whitespace" do
    tag.text = "cats of ynstagram"
    expect(tag).not_to be_valid
  end
end
