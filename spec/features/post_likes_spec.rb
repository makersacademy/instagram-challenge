require 'rails_helper'

RSpec.feature 'Posts likes', type: :feature do

  before(:each) do
    visit 'users/new'
    fill_in 'user[name]', with: 'Dave Dude'
    fill_in 'user[email]', with: 'davedude@example.com'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'

    click_on 'New post'
    attach_file 'post[image]', './images/post-image.jpg'
    click_on 'Post'

    within(first('.post')) do
      find('a').click
    end
  end
  
  scenario 'Users can add a like' do
    expect(page).to have_content '0 likes'
    click_on 'Like'
    expect(page).to have_content '1 like'
  end
end
