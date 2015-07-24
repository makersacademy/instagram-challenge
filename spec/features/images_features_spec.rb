require 'rails_helper'

feature 'Images' do

  context 'none have been uploaded' do
    scenario 'should let the user know there are no images' do
      visit '/images'
      expect(page).to have_content 'No images yet'
    end
  end

  context 'creating images' do

    scenario "allows creation" do
      visit '/images'
      click_link 'Add Image'
      fill_in 'Description', with: 'Anything'
      attach_file 'Picture', 'app/assets/images/fatty.jpg'
      click_button 'Create Image'
      expect(page).to have_selector 'img[src*="fatty.jpg"]'
    end
  end

end
