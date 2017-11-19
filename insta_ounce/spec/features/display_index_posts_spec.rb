require 'rails_helper'

feature 'Index displays a list of  all posts' do
  scenario 'the index displays all images and captions' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/happy_puppy.jpg")
    fill_in 'Caption', with: '1st post'
    click_button 'Create Post'
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/happy_puppy.jpg")
    fill_in 'Caption', with: '2nd post'
    click_button 'Create Post'
    visit '/'
    expect(page).to have_content("1st post")
    expect(page).to have_content("2nd post")
    expect(page).to have_css("img[src*='happy_puppy']")
  end
end
