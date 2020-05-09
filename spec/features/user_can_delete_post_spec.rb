require 'rails_helper'

RSpec.feature 'Edit a post', type: :feature do

  before(:each) do
    visit 'users/new'
    fill_in 'user[name]', with: 'Dave Dude'
    fill_in 'user[email]', with: 'davedude@example.com'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'
  end
  
  scenario 'User clicks on post, clicks delete, and accepts warning, post is deleted' do
    click_on 'New post'
    attach_file 'post[image]', './images/post-image.jpg'
    click_on 'Post'
    within(first('.post')) do
      find('a').click
    end
    click_on 'Delete'
    expect(page).to_not have_css '.post'
  end
end
