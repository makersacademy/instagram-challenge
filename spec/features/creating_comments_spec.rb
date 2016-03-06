require 'rails_helper'

feature 'Creating comments' do
  before(:each) do
    sign_up
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/scenery.jpg')
    fill_in 'Caption', with: 'great view!'
    click_button 'Create Post'
    click_link 'Sign out'
  end

  scenario 'can create a comment' do
    sign_up(email: "bob@bob.com", password: "password", password_confirmation: "password")
    click_link 'great view!'
    fill_in 'Content', with: 'That looks awesome!'
    click_button 'submit'
    expect(page).to have_content 'That looks awesome!'
  end
end
