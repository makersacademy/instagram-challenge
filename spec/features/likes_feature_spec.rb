require 'rails_helper'

feature 'liking a photo' do

  before do
    sign_up
    add_photo
    click_photo
  end

  scenario 'a user can like a photo, and updates the like count' do
    click_button 'Like'
    expect(page).to have_content('1 Like')
  end

  scenario 'two users can like a photo, and updates the like count' do
    click_button 'Like'
    click_link 'Sign out'
    sign_up2
    click_photo
    click_button 'Like'
    expect(page).to have_content('2 Likes')
  end

  scenario 'a user cannot like a photo more than once' do
    click_button 'Like'
    expect(page).not_to have_selector(:link_or_button, 'Like')
  end

end
