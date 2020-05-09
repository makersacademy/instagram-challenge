require 'rails_helper'

RSpec.feature 'Posts listed newest first', type: :feature do

  before(:each) do
    visit 'users/new'
    fill_in 'user[name]', with: 'Dave Dude'
    fill_in 'user[email]', with: 'davedude@example.com'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'
  end
  
  scenario 'Posts listed newest first' do
    click_on 'New post'
    attach_file 'post[image]', './images/post-image.jpg'
    click_on 'Post'

    click_on 'New post'
    attach_file 'post[image]', './images/post-image.jpg'
    select 'Greyscale', from: 'post[filter]'
    click_on 'Post'

    expect(first('.post')).to have_css '.filter_greyscale'
  end
end
