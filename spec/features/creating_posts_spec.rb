require 'rails_helper'

feature 'Posting to the feed' do
  scenario 'a user can post a picture to the feed' do
    visit '/'
    click_link 'New post'
    attach_file('post[picture]', "spec/files/images/cat.jpeg")
    fill_in 'Caption', with: 'Meet my little guy Jaja #catsofpinstagram'
    click_button 'Create Post'
    expect(page).to have_content('Meet my little guy Jaja #catsofpinstagram')
    expect(page).to have_css("img[src*='cat.jpeg']")
  end
end
