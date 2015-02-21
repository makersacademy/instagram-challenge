require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do

    scenario 'should be able to post by filling in a form' do
      visit '/posts'
      click_link 'Add a post'
      attach_file 'post_picture', 'spec/images/test_pic.jpeg'
      fill_in 'post_title', with: 'Cute kitten'
      click_button 'Create Post'
      expect(page).to have_content 'Cute kitten'
      expect(page).not_to have_content 'No posts'
      expect(Post.count).to eq 1
      expect(current_path).to eq '/posts'
    end
  end
end
