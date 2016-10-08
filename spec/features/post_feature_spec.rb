require 'rails_helper'
require_relative '../web_helper'


feature 'posts' do

  context 'no posts should have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    scenario 'should display post' do
      add_post('Oh look, a cat!', 'cat.jpg')
      expect(page).to have_content 'Oh look, a cat!'
      expect(page).not_to have_content 'No posts yet'
    end
  end

  context 'creating posts' do
    scenario 'users can create posts through form' do
      add_post('Oh look, a cat!', 'cat.jpg')
      expect(page).to have_content 'Oh look, a cat!'
      expect(page).to have_css "img[src*='cat']"
      expect(current_path).to eq '/posts'
    end

    scenario 'users must add an image' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: 'Oh look, a cat'
      click_button 'Add'
      expect(page).not_to have_content 'Oh look, a cat!'
      expect(page).to have_content "Image can't be blank"
    end
  end

  context 'viewing posts' do
    let!(:post){ Post.create(caption:'Oh look, a cat!',
                 image: File.new(Rails.root + 'public/images/cat.jpg'))}

    scenario 'users can view an individual post' do
      visit '/posts'
      first("a[href='/posts/#{post.id}']").click
      expect(page).to have_content 'Oh look, a cat!'
      expect(page).to have_css "img[src*='cat']"
      expect(current_path).to eq "/posts/#{post.id}"
    end
  end

  context 'editing posts' do
    scenario 'users can edit a post' do
      add_post('Oh look, a cat!', 'cat.jpg')
      edit_post('A different caption')
      expect(page).to have_content 'A different caption'
      expect(page).not_to have_content 'Oh look, a cat!'
      expect(current_path).to eq "/posts"
    end
  end

  context 'deleting posts' do
    scenario 'users can delete a post' do
      add_post('Oh look, a cat!', 'cat.jpg')
      click_link 'Delete'
      expect(page).to have_content 'Post deleted successfully'
      expect(page).not_to have_content 'Oh look, a cat!'
      expect(page).not_to have_css "img[src*='cat']"
    end
  end
end
