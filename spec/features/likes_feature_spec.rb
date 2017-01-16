require 'rails_helper'

feature 'likes' do
  context 'a user can like a image' do
    scenario 'link updates the image like count', js: true do
      sign_up
      add_image
      click_link 'Like Image' #are we liking images or the comment of the image?
      save_and_open_page
      expect(page).to have_content('1 like')
    end
  end
end
