require 'rails_helper'

feature "pictures" do

  include Helpers

  picture_1 = {
    filepath: "./spec/assets/test1.jpg",
    description: "where do tests go?"
  }

  picture_2 = {
    filepath: "./spec/assets/test2.jpg",
    description: "Friendship is magic!"
  }


  context "no pictures have been added" do
    scenario "I want to see a prompt to add a picture" do
      visit "/pictures"
        expect(page).to have_content("No pictures yet")
        expect(page).to have_link("Add a picture")
    end
  end

  context "pictures have been added" do
    before do
      add_picture(picture_1)
    end
    scenario "I want to see pictures" do
      visit '/pictures'
      expect(page).to have_content("where do tests go?")
      expect(page).not_to have_content("No pictures yet")
      expect(page).to have_css("img[src*='test1']")
    end
  end

  context "adding pictures" do
    scenario "I want to add a picture, then see it" do
      add_picture(picture_1)
      expect(current_path).to eq '/pictures'
      expect(page).to have_content "where do tests go?"
      expect(page).to have_css("img[src*='test1']")
    end
  end

  context "viewing pictures" do
    before do
      add_picture(picture_1)
      add_picture(picture_2)
    end
    scenario "I want to view a picture on individual page" do
      visit '/pictures'
      click_link("Test2")
      expect(page).not_to have_content("where do tests go?")
      expect(page).to have_content("Friendship is magic!")
    end
  end

  context "editing pictures" do
    before do
      add_picture(picture_2)
    end
    scenario "I want to edit a picture description" do
      visit '/pictures'
      click_link("Test2")
      click_link("Edit")
      fill_in "Description", with: "Team Brick!"
      click_button "Update"
      expect(page).to have_content("Team Brick!")
      expect(page).not_to have_content("Friendship is magic!")
    end
  end

  context "deleting pictures" do
    scenario "I want to delete a picture", :js => true do
      visit '/pictures'
      add_picture(picture_2)
      click_link("Test2")
      click_link("Delete")
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content "Picture has been deleted succesfully"
      expect(page).to have_content "No pictures yet"
      expect(page).not_to have_content "Friendship is magic!"
    end
  end
end
