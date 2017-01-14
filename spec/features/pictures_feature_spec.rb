require 'rails_helper'

  feature "pictures" do
    context "viewing no pictures" do
      scenario "no pictures have been add and therefore no pictures are currently being displayed" do

      visit("/pictures")
      expect(page).to have_content("No pictures to display")
      expect(page).to have_link("Add a picture")
    end
  end

  # context "viewing a picture" do
  #   Picture.create(image: )
  #   scenario "I want to display picture" do
  #     visit("/pictures")
  # end

  context "adding pictures" do
  
    scenario "I to to be able to add a picture" do
      visit("/pictures")
      click_link("Add a picture")


      expect(page).to have_content("Image")
      expect(current_path).to eq("/pictures/new")
    end
  end


end
