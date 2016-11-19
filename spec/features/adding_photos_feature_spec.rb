require 'rails_helper'

feature 'Photos' do

  context 'adding posts' do

    it 'signed in user can add a post' do
      sign_up
      expect(page).to(have_content("No photos yet"))
      expect(page).to(have_link("Add post"))
      click_link 'Add post'
      page.attach_file 'photo_image', "spec/images/toffee.jpg"
      fill_in 'Caption', with: 'Amazing doggie #toffee'
      click_button 'Create Photo'
      expect(page).to have_content 'Amazing doggie #toffee'
      expect(page).to have_css "img[src*='toffee.jpg']"
    end

    it 'logged out user cannot add posts' do
      visit '/photos'
      expect(page).not_to(have_link('Add post'))
    end

    it 'in order to post a caption the user must add a photo' do
      sign_up
      click_link 'Add post'
      fill_in 'Caption', with: 'I am not adding a photo'
      click_button 'Create Photo'
      expect(page).to(have_content('Please attach a photo'))
     end
  end

end
