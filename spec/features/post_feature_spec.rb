require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do

    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post to Instantgram'
    end
  end

  context 'a post has been added' do

    before do 
      Post.create(description: 'First Post')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('First Post')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'posting' do

    scenario 'prompts user to fill out a form then displays the post' do
      visit '/posts'
      click_link 'Post to Instantgram'
      fill_in 'Description', with: 'First Post'
      click_button 'Post'
      expect(page).to have_content('First Post')
      expect(current_path).to eq('/posts')
    end

  end
end