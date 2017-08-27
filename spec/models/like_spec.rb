describe Like do
  let(:user) { create(:user) }
  let(:photo) { create(:photo, user: create(:user, email: "penfold@mouse.com")) }
  subject(:like) { described_class.new(user: user, photo: photo) }

  it "is unique to the user in the scope of each photo" do
    described_class.create(user: user, photo: photo)
    expect(like).not_to be_valid
  end
end
