require 'rails_helper'

feature 'Creating posts' do
  scenario 'can create a post' do
    sign_up
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/IMG_1820a-wb.jpg')
    fill_in 'Title', with: 'Sunflowers'
    click_button 'Create Post'
    expect(page).to have_content('Sunflowers')
    expect(page).to have_css("img[src*='IMG_1820a-wb.jpg']")
  end

  scenario 'needs an image to create a post' do
    sign_up
    click_link 'New Post'
    fill_in 'Title', with: 'No picture added'
    click_button 'Create Post'
    expect(page).to have_content('Stop! You need an image to post!')
  end
end
