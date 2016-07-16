require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'create posts' do
    scenario 'uploads a picture' do
      create_post
      expect(page).to have_content 'PIC'
      expect(current_path).to eq posts_path
    end

    # scenario 'prompts user to add a picture' do
    # end
  end

  context 'viewing a post' do
    scenario 'user can view a post' do
      create_post
      find('.img_link').click
      expect(page).to have_content 'PIC'
      expect(current_path).to eq "/posts"
      create_post
    end

    # scenario 'post has a description' do
    # end

    # scenario 'users can add comments' do
    # end
  end
end
