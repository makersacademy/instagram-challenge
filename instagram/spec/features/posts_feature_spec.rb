require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    it 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content('No posts yet.')
      expect(page).to have_content('Add a post!')
    end
  end
  context 'adding posts' do
    it 'prompt user to fill a form then show post' do
      visit '/'
      click_link('Add a post!')
      attach_file('Image', "spec/files/images/test_post.png")
      fill_in 'Caption', with: 'This is my first picture!'
      click_button('Post')
      expect(page).to_not have_content 'No posts yet.'
      expect(page).to have_content 'This is my first picture!'
      expect(page).to have_css("img[src*='test_post.png']")
    end
    it 'doesn\'t allow creating new post without image' do
      visit '/'
      click_link('Add a post!')
      fill_in 'Caption', with: 'This is my second picture'
      click_button('Post')
      expect(page).to have_content 'Oops, you forgot to add a picture!'
    end
  end
end
