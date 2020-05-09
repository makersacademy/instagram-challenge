require 'rails_helper'

RSpec.feature 'Making a Post', type: :feature do

  before(:each) do
    visit 'users/new'
    fill_in 'user[name]', with: 'Dave Dude'
    fill_in 'user[email]', with: 'davedude@example.com'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'
  end

  scenario 'User can make a post' do
    click_on 'New post'
    attach_file 'post[image]', './images/post-image.jpg'
    click_on 'Post'
    expect(page).to have_css 'li.post'
  end

  scenario 'User can make a post adding a filter' do
    click_on 'New post'
    attach_file 'post[image]', './images/post-image.jpg'
    select 'Greyscale', from: 'post[filter]'
    click_on 'Post'
    expect(page).to have_css 'img.filter_greyscale'
  end

  scenario 'User can preview filter on image', js: true do
    click_on 'New post'
    attach_file 'post[image]', './images/post-image.jpg'
    select 'Greyscale', from: 'post[filter]'
    expect(page).to have_selector '.filter_greyscale'
  end
end
