require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'creating images' do
    scenario 'prompts user to fill out a form, then displays the new image' do
      visit '/images'
      click_link 'Add an image'
      expect(page).to have_content 'Name'
    end
  end

  context 'image has been added' do
    scenario 'display images' do
      visit '/images/new'
      fill_in 'Name', with: 'Missing'
      attach_file(id="image_image", Rails.root + 'public/images/thumb/missing.png')
      click_button 'Create Image'
      expect(page).to have_content('Missing')
      expect(page).not_to have_content('No images yet')
    end
  end
end
