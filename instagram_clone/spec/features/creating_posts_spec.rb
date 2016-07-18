require 'rails_helper'

feature 'Creating posts' do
  scenario 'can create a post' do
    sign_up
    create_post
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  scenario 'an image is required to create a post' do
    sign_up
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'nom nom nom'
    click_button 'Create Post'
    expect(page).to have_content('You need an image to post')
  end
end
