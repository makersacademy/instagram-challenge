require 'rails_helper'
require 'web_helper'

feature 'images' do
  context 'user sign in' do
    before do
       sign_up
    end

    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end

    scenario 'prompts user to fill out a form, then displays the new image' do
      visit '/images'
      click_link 'Add an image'
      attach_file('image_image', "public/img/original/missing.png")
      click_button 'Create Image'
      expect(current_path).to eq '/images'
    end
  end

  context 'user signed in and image added' do
    before do
      sign_up
      create_new_image
    end

    scenario 'display images' do
      visit '/images'
      expect(page).not_to have_content('No images yet')
    end

    scenario 'removes an image when a user clicks a delete link' do
      visit '/images'
      click_link 'Delete'
      expect(page).to have_content 'Image deleted successfully'
    end
  end

end
