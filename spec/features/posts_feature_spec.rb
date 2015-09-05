require 'rails_helper'

feature 'posts' do
  context 'no posts have been made' do
    scenario 'should display a prompt to make a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Make a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(text: 'Check out the hot new service CHRINSTAGRAM!!!')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Check out the hot new service CHRINSTAGRAM!!!')
      expect(page).not_to have_content('No posts yet')
    end
  end


  context 'making posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Make a post'
      fill_in 'Text', with: 'Check out the hot new service CHRINSTAGRAM!!!'
      click_button 'Create Post'
      expect(page).to have_content 'Check out the hot new service CHRINSTAGRAM!!!'
      expect(current_path).to eq '/posts'
    end
  end
end
