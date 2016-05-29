feature "creating post" do
  before do
    user = create :user
    log_in
    click_link "New"
    fill_in "Caption", with: "hipster coffee"
  end

  context "when image is selected" do
    scenario "can create a post" do
      attach_file("Image", "spec/files/images/hipster.jpg")
      click_button "Create"
      expect(page).to have_content "hipster coffee"
      expect(page).to have_css("img[src*='hipster.jpg']")
    end
  end
  context "when image is not selected" do
    scenario "can not create a post" do
      click_button "Create"
      expect(page).to have_content "Uh oh! You need to select an image!"
    end
  end
end
