require 'rails_helper'

feature 'Editing posts' do
  before do
    visit '/'
    sign_up
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/scenery.jpg')
    fill_in 'Caption', with: 'This post will be edited'
    click_button 'Create Post'
    visit '/'
    click_link 'This post will be edited'
  end

  scenario 'a user can edit a post' do
    click_link 'Edit Post'
    fill_in 'Caption', with: 'I am making an edit to this caption!'
    click_button 'Update Post'
    expect(page).to have_content 'Your post has been updated'
    expect(page).to have_content 'I am making an edit to this caption!'
  end

  scenario 'a user cannot edit a post without an image' do
    click_link 'Edit Post'
    attach_file('Image', 'spec/files/images/scenery.zip')
    click_button 'Update Post'
    expect(page).to have_content("You did not attach an image in the correct format! Please try again!")
  end

  scenario 'a user cannot edit another users posts' do
    click_link 'Sign out'
    sign_up(email: 'bob@bob.com', password: 'password', password_confirmation: 'password')
    click_link 'This post will be edited'
    expect(page).not_to have_content 'Edit Post'
  end

end
