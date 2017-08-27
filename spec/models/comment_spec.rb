describe Comment do
  let(:user) { create(:user) }
  let(:photo) { create(:photo, user: create(:user, email: "penfold@mouse.com")) }
  subject(:comment) { described_class.new(user: user, photo: photo) }

  it "is invalid without text" do
    expect(comment).not_to be_valid
  end

  it "is invalid when the text is too short" do
    comment.text = "!"
    expect(comment).not_to be_valid
  end

  it "validates when text is at least 2 characters long" do
    comment.text = ":)"
    expect(comment).to be_valid
  end
end
