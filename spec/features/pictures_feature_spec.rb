require 'rails_helper'

  feature "pictures" do
    context "viewing no pictures" do
      scenario "no pictures have been add and therefore no pictures are currently being displayed" do

      visit("/pictures")
      expect(page).to have_content("No pictures to display")
      expect(page).to have_link("Add a picture")
    end
  end

  context "viewing a picture" do

    scenario "I want to display a thumbnail picture" do
      upload_image
      visit("/pictures")

      expect(page).not_to have_content("No pictures to display")
      expect(page).to have_css 'img#show-thumbnail'
    end
  end

  context "adding pictures" do

    scenario "I want to to be able to add a picture" do
      upload_image
      expect(page).not_to have_content("No pictures to display")
      expect(page).to have_content("Quote 1")
      expect(page).to have_css 'img#show-picture'
      expect(current_path).to eq("/pictures/2")
    end
  end

  context "displaying full view pictures" do
    scenario "I want to see full view of my picture" do
      upload_image
      visit("/pictures")
      click_link("Quote 1")
      expect(page).not_to have_content("No pictures to display")
      expect(page).to have_css 'img#show-picture'
      expect(current_path).to eq("/pictures/3")
    end
  end

  context "pictures page" do
    scenario "I want to be able to got back to the pictures page from the full view page" do
      upload_image
      visit("/pictures")
      click_link("Quote 1")
      click_link("All Pictures")

      expect(page).to have_css 'img#show-thumbnail'
      expect(current_path).to eq("/pictures")
    end
  end
end
