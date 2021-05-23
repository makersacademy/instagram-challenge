require 'rails_helper'

feature 'Posting to the feed more than once' do
    scenario 'a user can post a picture to the feed and see multiple posts' do
      visit '/'
      click_link 'New post'
      attach_file('post[picture]', "spec/files/images/cat.jpeg")
      fill_in 'Caption', with: 'Meet my best friend Jaja #catsofpinstagram'
      click_button 'Create Post'
      click_link 'New post'
      attach_file('post[picture]', "spec/files/images/coffee.jpeg")
      fill_in 'Caption', with: 'Coffee is life'
      click_button 'Create Post'
      expect(page).to have_content('Meet my best friend Jaja #catsofpinstagram')
      expect(page).to have_css("img[src*='cat.jpeg']")
      expect(page).to have_content('Coffee is life')
      expect(page).to have_css("img[src*='coffee.jpeg']")
    end
end 