RSpec.feature "Photos" do
  before do
    sign_up
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

  it "allows users to tag their photos" do
    visit "/photos/new"
    attach_file("Image", Rails.root + "spec/fixtures/chess.JPG")
    fill_in("Description", with: "Emily plays chess!")
    fill_in("photo_tags", with: "cats catsofynstagram")
    click_button("Upload")
    click_first_photo
    expect(page).to have_content("#cats #catsofynstagram")
  end
end
