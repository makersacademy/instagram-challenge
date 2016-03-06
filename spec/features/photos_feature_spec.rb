require 'rails_helper'

feature 'Homepage photo view' do
  context 'No photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/'
      expect(page).to have_content "Nobody is using our site :'("
      expect(page).to have_link 'InstaGratify'
    end
  end

  context 'Adding a new photo' do
    scenario 'User is not logged in' do
      visit '/'
      click_link 'InstaGratify'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
      expect(current_path).to eq '/users/sign_in'
      expect(page).not_to have_selector('img')
    end

    xscenario 'User is logged in' do
      sign_up_and_in('me@metest.com', 'thisisapassword', 'Viola')
      new_upload('spec/support/photo_upload_placeholder.jpg', 'Amazing times', 'makers')
      expect(page).to have_content 'Amazing times'
      expect(current_path).to eq '/photos'
      expect(page).to have_selector('img')
    end
  end
end
