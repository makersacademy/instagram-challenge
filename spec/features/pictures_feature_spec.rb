require 'rails_helper'

  feature "pictures" do
    context "viewing pictures" do
      scenario "no pictures have been add and therefore no pictures are currently being displayed" do

      visit("/pictures")
      expect(page).to have_content("No pictures to display")
      expect(page).to have_link("Add a picture")
    end 
  end
end
