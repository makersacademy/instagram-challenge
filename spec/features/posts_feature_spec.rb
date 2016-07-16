require 'rails_helper'

feature 'Create posts' do
    scenario 'should display a prompt to add a photo' do
      visit '/'
      click_link 'New Post'
      attach_file 'Image', "spec/files/images/canada.jpg"
      fill_in 'Caption', with: 'Snowboarding in Canada #winter'
      click_button 'Create Post'
      expect(page).to have_content 'Snowboarding in Canada #winter'
      expect(page).to have_css "img[src*='canada.jpg']"
    end
end
