require 'rails_helper'
require 'web_helpers'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a link to add a post' do
      visit '/posts'
      sign_up
      expect(page).to have_content 'There are no posts yet!'
      expect(page).to have_link 'Create a post'
    end
  end


  context 'create posts' do
    scenario 'prompt user to fill out a form, then displays the new post' do
      sign_up
      upload_post
      expect(page).to have_css 'img'
      expect(page).to have_content 'Beautiful view'
      expect(page).to_not have_content 'There are no posts yet'
      expect(current_path).to eq '/posts'
    end


  scenario 'post cannot be created without an image' do
    sign_up
    upload_post_without_image
    expect(page).to have_content 'You need an image to post'
    end
  end


  context 'deleting posts' do

    scenario 'removes a restaurant when a user clicks a delete link' do
      sign_up
      upload_post
      visit '/'
      click_link 'Delete'
      expect(page).not_to have_content 'Beautiful view'
      expect(page).to have_content 'Post deleted successfully'
    end

  end

  context 'a user must be logged in to create post' do
      scenario 'add link is not shown' do
        visit '/'
        expect(page).to have_content 'Sign in'
        expect(page).to have_content 'Sign up'
        expect(page).not_to have_content 'Sign out'
        expect(page).to have_content 'There are no posts yet'
        expect(page).not_to have_link 'Create a post'
      end
    end

end
