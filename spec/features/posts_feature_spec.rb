require 'rails_helper'
require 'web_helper'

feature 'posts' do
  context 'no posts have been added' do
    it 'should display a prompt to add a post' do
      sign_up
      expect(page).to have_content 'No posts as of yet'
      expect(page).to have_link 'New Post'
    end
  end

  context 'creating a post' do
    it 'prompts user to fill out a form and displays the new post' do
      sign_up
      click_link 'New Post'
      fill_in 'Description', with: 'hello'
      click_button 'Create Post'
      expect(page).to have_content 'hello'
      expect(current_path).to eq '/'
    end
  end
end
