require 'rails_helper'

feature "pictures" do
  context "no pictures have been added" do
    scenario "should display a prompt to add a picture" do
      visit "/pictures"
        expect(page).to have_content("No pictures yet")
        expect(page).to have_link("Add a picture")
    end
  end

  context "pictures have been added" do
    before do
      visit '/pictures'
      click_link("Add a picture")
      attach_file("Upload Your Picture", Rails.root + "./spec/assets/test1.jpg")
      fill_in "Description", with: "Friendship is magic!"
      click_button "Add Picture"
    end
    scenario "display pictures" do
      visit '/pictures'
      expect(page).to have_content("Friendship is magic!")
      expect(page).not_to have_content("No pictures yet")
      expect(page).to have_css("img[src*='test1']")
    end
  end

  context "adding pictures" do
    scenario "prompts user to fill out a form, then displays the pictures" do
      visit '/pictures'
      click_link("Add a picture")
      attach_file("Upload Your Picture", Rails.root + "./spec/assets/test1.jpg")
      fill_in "Description", with: "where do tests go?"
      click_button "Add Picture"
      expect(current_path).to eq '/pictures'
      expect(page).to have_content "where do tests go?"
      expect(page).to have_css("img[src*='test1']")
    end
  end
end
