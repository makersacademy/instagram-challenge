require 'rails_helper'

feature 'images' do
  context 'no images have been posted' do
    scenario 'should display a prompt to post an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Post image'
    end
  end
end
