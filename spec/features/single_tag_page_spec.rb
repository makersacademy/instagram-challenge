RSpec.feature "Tag pages" do
  let(:tag) { create(:tag) }

  before do
    tag.photos << create(:photo)
  end

  it "shows all photos which have a particular tag" do
    visit "/tags/#{tag.text}"
    expect(page).to have_css("img[src*='chess.JPG']")
  end
end
