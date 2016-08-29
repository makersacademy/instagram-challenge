require 'rails_helper'

feature "Pictures" do
  context "There aren't any pictures yet" do
    scenario "Should prompt the user to upload a picture" do
      visit '/pictures'
      expect(page).to have_content "No one has added any pictures yet!"
      expect(page).to have_link "Add a picture!"
    end
    scenario "A user wants to upload an image" do
      visit '/pictures'
      click_link "Add a picture!"
      page.attach_file('picture_image', Rails.root + 'spec/capybara.jpg')
      click_button "Upload Image"
    end
  end
end
