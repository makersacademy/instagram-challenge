require "rails_helper"

feature "photos" do
  before { visit "/photos" }
  context "users can view their photos:" do
    scenario "no photos uploaded it will display message" do
      expect(page).to have_content "No photos available"
    end
  end
  scenario "users can add a photo" do
    click_link "Add photo"
    fill_in "Title", with: "Beach photo"
    fill_in "Description", with: "Not actually a photo to do with the beach"
    "upload_photo ..."
    expect(page).not_to have_content "No photos available"
  end
end