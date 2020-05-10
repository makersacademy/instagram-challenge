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
    expect(page).to have_content '1 likes'
  end
  
  scenario 'Users cannot add more than one like per post' do
    expect(page).to have_content '0 likes'
    click_on 'Like'
    expect(page).to have_content '1 likes'
    expect(page).to_not have_button 'Like'
  end
  
  scenario 'User can remove a like' do
    expect(page).to have_content '0 likes'
    click_on 'Like'
    expect(page).to have_content '1 likes'
    expect(page).to_not have_button 'Like'
    click_on 'Unlike'
    expect(page).to have_content '0 likes'
    expect(page).to_not have_button 'Unlike'
  end
end
