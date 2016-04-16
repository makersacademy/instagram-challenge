require "rails_helper"

feature "photos" do
  context "no photos" do
    scenario "displays a prompt to add a photos" do
      visit photos_path
      expect(page).to have_content "No photos yet"
      expect(page).to have_link "New Photo"
    end
  end

  context "adding photos" do
    scenario "allows user to add a new photo" do
      visit photos_path
      click_link "New Photo"
      attach_file :photo_image, "./spec/images/kitten.jpg"
      fill_in "Status", with: "Fluffy kitten"
      click_button "Post"
      expect(current_path).to eq photos_path
      expect(page).to have_css "img[src*=kitten]"
      expect(page).to have_content "Fluffy kitten"
    end
  end

  context "viewing photos" do
    scenario "allows user to view a photo" do
      photo = FactoryGirl.create(:photo)
      visit "/photos"
      find(".image").click
      expect(current_path).to eq photo_path(photo)
      expect(page).to have_css "img[src*=kitten]"
      expect(page).to have_content photo.status
    end
  end
end
