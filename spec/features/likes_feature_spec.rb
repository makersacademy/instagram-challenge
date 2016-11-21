require 'rails_helper'

feature 'liking photos' do

  before do
    sign_up_and_in('me@metest.com', 'thisisapassword', 'Viola')
    basic_new_upload('spec/support/photo_upload_placeholder.jpg',
                     'Amazing times')
  end

  scenario 'a user can only like photos if they are signed in' do
    sign_out
    visit '/photos'
    click_button 'Like'
    expect(page).not_to have_content('1 Like')
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  # scenario 'a user can like a photo, which updates the number of likes' do
    xit 'increments the number of likes', :js => true do
      click_button 'Like'
      expect(page).to have_content('1 Like')
    end
  # end

end
