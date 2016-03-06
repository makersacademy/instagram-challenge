require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No Images Yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'adding an image' do
    scenario 'fill out a form and then display new image' do
      visit '/images'
      click_link 'Add an image'
      fill_in 'Name', with: 'Capybara Family'
      fill_in 'Description', with: 'Aren\'t they cute?'
      attach_file('Image', '/Users/user/Pictures/CapybaraFamily.jpg')
      click_button 'Create Image'
      expect(page).to have_xpath("//img[contains(@src, 'CapybaraFamily.jpg')]")
      expect(current_path).to eq '/images'
    end
  end
end