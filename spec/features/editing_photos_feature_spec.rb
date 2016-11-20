require 'rails_helper'

feature 'Photos' do

  context 'editing posts' do

    it 'signed in user can edit their own posts' do

      sign_up
      click_link 'Add post'
      page.attach_file 'photo_image', "spec/images/toffee.jpg"
      fill_in 'Caption', with: 'Amazing doggie #toffee'
      click_button 'Create Photo'
      expect(page).to have_css "img[src*='toffee.jpg']"
      click_link "Edit photo"
      fill_in 'Caption', with: 'A very mad dog #bonkers'
      click_button 'Update Photo'
      expect(page).to(have_content('bonkers'))
    end

    it 'logged out user cannot edit any posts' do
      visit '/'
      expect(page).not_to(have_link('Edit photo'))
    end
  end
end
