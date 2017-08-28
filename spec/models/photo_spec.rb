describe Photo do
  let(:user) { create(:user) }
  subject(:photo) { described_class.new(user: user) }

  it "is invalid without an image attachment" do
    expect(photo).not_to be_valid
  end

  it "validates when an attachment is given" do
    photo.image = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'chess.JPG'), 'image/png')
    expect(photo).to be_valid
  end

  it "removes attached likes when it is deleted" do
    photo.image = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'chess.JPG'), 'image/png')
    photo.save
    create(:like, photo: photo, user: create(:user, email: "penfold@mouse.com"))
    photo.destroy
    expect(Like.count).to eq 0
  end

  it "removes attached comments when it is deleted" do
    photo.image = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'chess.JPG'), 'image/png')
    photo.save
    create(:comment, photo: photo, user: create(:user, email: "penfold@mouse.com"))
    photo.destroy
    expect(Comment.count).to eq 0
  end

  describe "#return_filter" do
    it "returns nil if the filter is none or nil" do
      photo.save
      expect(photo.return_filter).to be_nil
    end

    it "returns any other filters as a symbol" do
      photo.filter = "lomo"
      photo.save
      expect(photo.return_filter).to eq :lomo
    end
  end
end
