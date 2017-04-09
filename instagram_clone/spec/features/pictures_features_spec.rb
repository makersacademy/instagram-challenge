require 'rails_helper'

feature "Pictures" do
  context "uploads" do
    scenario "can be added by users" do
      # Add sign-up and sign in later
      visit '/'
      click_link 'Add picture'
      fill_in :picture_image_url, with: "http://orig14.deviantart.net/81f1/f/2011/048/6/7/672411b782223f9453780e7f3fb594b7-d39qorm.jpg"
      click_button 'Create Picture'
      expect(page).to have_content('Image uploaded successfully.')
    end
  end
end
