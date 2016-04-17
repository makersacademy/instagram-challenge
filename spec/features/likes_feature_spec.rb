require 'rails_helper'

feature 'liking photos' do
  scenario 'prompt to like photo' do
    visit '/pictures'
    click_link 'Add picture'
    attach_file 'picture[image]', 'app/assets/images/DOGE.jpeg'
    fill_in 'Description', with: 'much doge'
    click_button 'Add'
    click_link 'photo'
    expect(page).to have_content('Be the first to like this!')
  end

  scenario 'a user can like a photo, which adds to like count', js: true do
    visit '/pictures'
    click_link 'Add picture'
    attach_file 'picture[image]', 'app/assets/images/DOGE.jpeg'
    fill_in 'Description', with: 'much doge'
    click_button 'Add'
    click_link 'photo'
    click_link 'Like'
    expect(page).to have_content('Likes: 1')
  end
end
