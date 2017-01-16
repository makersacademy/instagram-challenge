require 'rails_helper'

feature 'likes' do
  context 'a user can like a image' do
    xscenario 'link updates the image like count', js: true do
      sign_up
      add_image
      click_link 'Like Image' #are we liking images or the comment of the image?
      expect(page).to have_content('1 like')
    end
  end
end
