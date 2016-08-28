require 'rails_helper'

feature 'Creating posts' do
  scenario 'user can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/cat.jpg')
    fill_in 'Caption', with: "My cat"
    click_button 'Create Post'
    expect(page).to have_content "My cat"
    expect(page).to have_css("img[src*='cat.jpg']")
  end

  scenario 'user must include a pic to post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "Whatever!! #yolo"
    click_button 'Create Post'
    expect(page).to have_content 'Halt! You need an image to post here!'
  end
end
