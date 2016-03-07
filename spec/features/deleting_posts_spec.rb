require 'rails_helper'

feature 'Deleting posts' do
  before do
    visit '/'
    sign_up
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/scenery.jpg')
    fill_in 'Caption', with: 'This post was accidental.'
    click_button 'Create Post'
    visit '/'
    click_link 'This post was accidental.'
  end

  scenario 'users can delete posts' do
    click_link 'Delete Post'
    expect(page).to have_content 'Your post has been deleted'
    expect(page).not_to have_content 'This post was accidental.'
  end

  scenario 'users can only delete their own posts' do
    click_link 'Sign out'
    sign_up(email: 'bob@bob.com',password: '12345678',password_confirmation: '12345678')
    click_link 'This post was accidental.'
    expect(page).not_to have_content 'Delete Post'
  end
end
