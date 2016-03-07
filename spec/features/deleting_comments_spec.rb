require 'rails_helper'

feature 'Deleting comments' do
  before(:each) do
    sign_up
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/scenery.jpg')
    fill_in 'Caption', with: 'great view!'
    click_button 'Create Post'
    click_link 'Sign out'
  end

  scenario 'user can delete a comment they have posted' do
    sign_up(email: "bob@bob.com", password: "password", password_confirmation: "password")
    click_link 'great view!'
    fill_in 'Content', with: 'That looks awesome!'
    click_button 'submit'
    click_link 'Delete Comment'
    expect(page).not_to have_content 'That looks awesome!'
  end

  scenario 'user cannot delete another users comments' do
    sign_up(email: "bob@bob.com", password: "password", password_confirmation: "password")
    click_link 'great view!'
    fill_in 'Content', with: 'That looks awesome!'
    click_button 'submit'
    click_link 'Sign out'
    sign_up(email: "rob@rob.com", password: "password", password_confirmation: "password")
    click_link 'great view!'
    expect(page).not_to have_content 'Delete Comment'
  end
end
