require "rails_helper"

feature "photos" do
  include Helpers

  context "no photos have been added" do
    scenario "displays a prompt to add a photos" do
    visit photos_path
    expect(page).to have_content "No photos yet"
    expect(page).to have_link "Add Photo"
    end
  end

  context "adding photos" do
    scenario "adding a new photo" do
      visit photos_path
      click_link "Add Photo"
      attach_file :photo_image, "./spec/images/coffee.jpg"
      fill_in "Caption", with: "Morning coffee"
      click_button "Post"

      expect(current_path).to eq photos_path
      expect(page).to have_content "Morning coffee"
    end
  end

  context 'viewing photos' do
    scenario "allows user to view a photo" do
      visit_index
      # photo = FactoryGirl.create(:photo)
      # visit photos_path
      find(".image").click
      expect(current_path).to eq photo_path(@photo)
      expect(page).to have_content @photo.caption
    end
  end

  context "editing a photo\'s caption" do
    scenario "allows user to update it" do
      # photo = FactoryGirl.create(:photo)
      # visit photos_path
      visit_index
      click_link "Edit"
      fill_in "Caption", with: "Morning glory"
      click_button "Save"
      expect(page).to have_content "Morning glory"
      expect(current_path).to eq photos_path
    end
  end

  context "deleting photos" do
    scenario "allows a user to delete a photo" do
      visit_index
      click_link "Delete"
      expect(page).not_to have_css "img[src*=coffee]"
      expect(page).not_to have_content @photo.caption
      expect(page).to have_content "Successfully deleted the photo!"
      expect(current_path).to eq photos_path
    end
  end

end
