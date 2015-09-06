require 'rails_helper'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/monkey.jpg")
    fill_in 'Caption', with: 'What a cute little #monkey'
    click_button 'Create Post'
    expect(page).to have_content('#monkey')
    expect(page).to have_css("img[src*='monkey.jpg']")
  end

  scenario 'cannot create post without image' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "Best image ever... NOT"
    click_button 'Create Post'
    expect(page).to have_content('Nope! You need an image to post here!')
  end
end
