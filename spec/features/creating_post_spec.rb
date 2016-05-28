feature "creating post" do
  scenario "can create a post" do
    visit "/"
    click_link "New"
    fill_in "Caption", with: "hipster coffee"
    attach_file("Image", "spec/files/images/hipster.jpg")
    click_button "Submit"
    expect(page).to have_content "hipster coffee"
    expect(page).to have_css("img[src*='hipster.jpg']")
  end
end
