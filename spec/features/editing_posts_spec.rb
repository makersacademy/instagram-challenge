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
    # find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'a user can edit a post' do
    fill_in 'Caption', with: 'I am making an edit to this caption!'
    click_button 'Update Post'

    expect(page).to have_content 'Your post has been updated'
    expect(page).to have_content 'I am making an edit to this caption!'
  end

  scenario 'a user cannot edit a post without an image' do
    attach_file('Image', 'spec/files/images/scenery.zip')
    click_button 'Update Post'
    expect(page).to have_content("You did not attach an image in the correct format! Please try again!")
  end

end
