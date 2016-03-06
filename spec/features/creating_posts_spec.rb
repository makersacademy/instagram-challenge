require 'rails_helper'

feature 'Creating Posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/scenery.jpg')
    fill_in 'Caption', with: 'great view!'
    click_button 'Create Post'
    expect(page).to have_content('great view!')
    expect(page).to have_css("img[src*='scenery.jpg']")
  end

  scenario 'cannot create a post without an image' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'What a nice picture'
    click_button 'Create Post'
    expect(page).to have_content('You need to upload an image to post!')
  end
end
