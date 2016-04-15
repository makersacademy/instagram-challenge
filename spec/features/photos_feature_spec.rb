require "rails_helper"

feature "photos" do
  context "no photos" do
    scenario "displays a prompt to add a photos" do
      visit photos_path
      expect(page).to have_content "No photos yet"
      expect(page).to have_link "New Photo"
    end
  end
end
