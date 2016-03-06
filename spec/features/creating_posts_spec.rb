require 'rails_helper'

feature 'Creating posts' do
  scenario 'can create a new post' do
    sign_up('bingo888@gmail.com', 'bingo888')
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/hong_kong.jpg")
    fill_in 'Caption', with: 'I love HK! #myfavplace'
    click_button 'Create Post'
    expect(page).to have_content('I love HK! #myfavplace')
    expect(page).to have_css("img[src*='hong_kong.jpg']")
  end

  scenario 'requires an image to create a post' do
    sign_up('bingo888@gmail.com', 'bingo888')
    click_link 'New Post'
    fill_in 'Caption', with: 'I have no photo attached'
    click_button 'Create Post'
    expect(page).to have_content('Please attach an image to post!')
  end
end