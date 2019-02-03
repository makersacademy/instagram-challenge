require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'a logged in user can create a post' do
    sign_up_steps
    click_link 'New Post'
    attach_file('Image', "files/images/goldblumdog.jpg")
    fill_in 'Caption', with: 'Goldblum dog'
    click_button 'Create Post'
    expect(page).to have_content('Goldblum dog')
    expect(page).to have_css("img[src*='goldblumdog.jpg']")
  end

  scenario 'A user can only post if logged in' do
    visit '/'
    expect(page).not_to have_content('New Post')
  end

  scenario 'Adding image is required to create new post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'Goldblum sunset dog'
    click_button 'Create Post'
    expect(page).to have_content('Error: you must add an image to post')
  end
end
