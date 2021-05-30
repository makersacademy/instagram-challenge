require 'rails_helper'

feature 'Creating posts' do
  background do
    user = create :user
    visit '/'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

  scenario 'can create a new post' do
    visit '/'
    click_link('new-post')
    attach_file('image', 'spec/files/images/sunrise.jpg')
    fill_in 'caption', with: 'Amazing sunrise! #sunrise'
    click_button 'Post'
    expect(page).to(have_content('Amazing sunrise! #sunrise'))
    expect(page).to(have_css("img[src*='sunrise.jpg']"))
  end

  scenario 'posting without an image' do
    visit '/'
    click_link('new-post')
    fill_in 'caption', with: 'Amazing sunrise! #sunrise'
    click_button 'Post'
    expect(page).to(have_content('Please add an image'))
  end

  scenario 'posting an invalid file' do
    visit '/'
    click_link('new-post')
    attach_file('image', 'spec/files/sunrise.txt')
    fill_in 'caption', with: 'Amazing sunrise! #sunrise'
    click_button 'Post'
    expect(page).to(have_content('Please add an image'))
  end
end
