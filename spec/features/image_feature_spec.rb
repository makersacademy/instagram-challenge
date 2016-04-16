require 'rails_helper'

feature 'Image' do
  context 'no images added yet' do
    scenario 'should have button to add images' do
      visit '/images'
      expect(page).to have_content('No images added yet')
      expect(page).to have_link('Upload new image')
    end
  
    scenario 'user can add a image' do
      visit '/images'
      click_link('Upload new image')
      fill_in ('Name'), with: 'Test image'
      fill_in ('Description'), with: 'Test description'
      attach_file 'image[image]', Rails.root + 'spec/support/uploads/test_image.jpg'
      click_button('Upload image')
      expect(current_path).to eq('/images')
      expect(page).not_to have_content 'No images added yet'
      expect(page).to have_xpath("//img[contains(@src, 'test_image.jpg')]")
    end
  end
end
