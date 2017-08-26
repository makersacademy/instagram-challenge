RSpec.feature "Photos" do
  before do
    sign_up
  end

  it "has a page for uploading a new photo" do
    visit "/photos/new"
    expect(page).to have_content "Upload a photo to Ynstagram"
  end

  it "allows the user to upload a photo" do
    visit "/photos/new"
    fill_in("Description", with: "Emily plays chess!")
    attach_file("Image", Rails.root + "spec/fixtures/chess.JPG")
    click_button("Upload")
    expect(page).to have_css("img[src*='chess.JPG']")
  end

  it "prevents uploads by users who are not logged in" do
    logout
    visit "/photos/new"
    expect(page).to have_content "You need to sign in or sign up before continuing"
  end
end
