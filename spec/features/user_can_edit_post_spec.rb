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
  
  scenario 'User can click on a post, click to edit it, and change filter on a post' do
    click_on 'New post'
    attach_file 'post[image]', './images/post-image.jpg'
    click_on 'Post'
    within(first('.post')) do
      find('a').click
    end
    click_on 'Edit'
    select 'Greyscale', from: 'post[filter]'
    click_on 'Update'
    expect(page).to have_css 'img.filter_greyscale'
  end
end
