require 'rails_helper'

feature 'gallery' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/gallery'
      expect(page).to have_content "No galleries yet"
      expect(page).to have_link "Add a gallery"
    end
  end

  context "galleries have been added" do
    before do
      Gallery.create(name: "GB favourites")
    end

    scenario "display galleries" do
      visit "/galleries"
      expect(page).to have_content("GB favourites")
      expect(page).not_to have_content("No galleries yet")
    end

  end

end
