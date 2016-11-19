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

  context 'creating galleries' do
    scenario 'prompts user to fill out the new gallery creation form, then displays it' do
      visit '/galleries'
      click_link "Add a gallery"
      fill_in "Name", with: "GB favourites"
      click_button "Create Gallery"
      expect(page).to have_content "GB favourites"
      expect(current_path).to eq "/gallery"
    end
  end

  context "viewing galleries" do
    let!(:gallery1) {Gallery.create(name: 'GB Gallery')}
    scenario 'lets a user view a gallery' do
      visit '/galleries'
      click_link 'GB Gallery'
      expect(page).to have_content 'GB Gallery'
      expect(current_path).to eq "/galleries/#{gallery1.id}"
    end
  end

end
