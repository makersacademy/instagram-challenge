require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created post information' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/images/racebike.jpg")
    fill_in 'Caption', with: 'This is my first expectation'
    click_button 'Create Post'
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/images/racebike.jpg")
    fill_in 'Caption', with: 'This is my second expectation'
    click_button 'Create Post'
    expect(page).to have_content("This is my first expectation")
    expect(page).to have_css("img[src*='racebike']")
    expect(page).to have_content("This is my second expectation")
    expect(page).to have_css("img[src*='racebike']")
  end
end
