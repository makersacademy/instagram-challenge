require 'rails_helper.rb'
require 'web_helper'

feature 'Creating posts' do
  scenario 'can create a post' do
    create_post
    expect(page).to have_content('#foodart')
    expect(page).to have_css("img[src*='foodart.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'amazing #foodart'
    click_button 'Create Post'
    expect(page).to have_content('No image uploaded!')
  end
end
