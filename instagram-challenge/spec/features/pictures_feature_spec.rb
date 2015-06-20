require 'rails_helper'

feature 'Pictures' do
  context 'no pictures have been added' do
    scenario 'should ask user to add a picture' do
      visit '/pictures'
      expect(page).to have_content "No pictures added yet"
      expect(page).to have_content "Add a picture"
    end
  end

  context 'picture have been added' do
    scenario 'and displayed on the homepage' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'Image', 'spec/features/Iceland.jpg'
      fill_in('Description', with: 'My lovely Iceland')
      click_button 'Create Picture'
      expect(page).to have_content 'My lovely Iceland'
      expect(page).to have_css('img[alt="Iceland"]')
    end
  end
end