require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a new post'
    end
  end

  context 'Creating posts' do
    scenario 'prompts user with a form and on fill in it displays the new image post' do
      visit '/'
      click_link 'New Post'
      attach_file('Image', "spec/files/images/ironing-boards.jpg")
      fill_in 'Caption', with: 'sad story of #ironing-boards'
      click_button 'Create Post'
      expect(page).to have_content('#ironing-boards')
    end
  end

end
