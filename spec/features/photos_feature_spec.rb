require "rails_helper"

feature "photos" do
  before do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "Test@email.co.uk"
    fill_in "Password", with: "testtest"
    fill_in "Password confirmation", with: "testtest"
    click_button "Sign up"
    click_link "My Photos"
  end
  context "users can view their photos:" do
    scenario "no photos uploaded it will display message" do
      expect(page).to have_content "No photos available"
    end
  end
  scenario "users can add a photo" do
    click_link "Add photo"
    fill_in "Title", with: "Beach photo"
    fill_in "Description", with: "Not actually a photo to do with the beach"
    attach_file "photo_image", Rails.root.join("spec/fixtures", "test_photo.png")
    click_button "Add Photo"
    expect(page).not_to have_content "No photos available"
    expect(page).to have_content Rails.root.join("spec/fixtures", "test_photo.png")
  end
end