require 'rails_helper'

feature 'posts' do

  after do
    remove_uploaded_file
  end

  context 'no posts have been added' do
    scenario 'should display a prompt to upload a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post to instagram'
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      sign_up_test
      create_post
      expect(page).to have_content 'My first post'
      expect(page).to have_css("img[src*='test.png']")
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    scenario 'lets a user view a post' do
     visit '/posts'
     sign_up_test
     create_post
     find("img[src*='test.png']").click
     expect(page).to have_content 'My first post'
    #  expect(current_path).to eq "/posts/1"
    end
  end

  context 'editing posts' do

    scenario 'let a user edit a post' do
     visit '/posts'
     sign_up_test
     create_post
     click_link 'Edit post'
     fill_in 'Caption', with: 'My post'
     click_button 'Update Post'
     expect(page).to have_content 'My post'
     expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do


    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      sign_up_test
      create_post
      click_link 'Delete post'
      expect(page).not_to have_content 'My first post'
      expect(page).to have_content 'Post deleted successfully'
    end
  end

end
