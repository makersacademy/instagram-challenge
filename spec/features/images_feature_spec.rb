require 'rails_helper'

feature 'uploading images' do
  context 'users can upload images' do
    scenario 'allows users to upload images via a form' do
      visit '/images/new'
      fill_in 'image_name', with: 'Image title'
      attach_file 'image_image', 'spec/cat.jpg'
      click_button 'Create Image'
      expect(page).to have_content 'Image title'
    end
  end
end
