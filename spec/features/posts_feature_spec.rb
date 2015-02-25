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
      user_sign_up
      create_post
      expect(page).to have_content 'Cute kitten'
      expect(page).not_to have_content 'No posts'
      expect(Post.count).to eq 1
      expect(current_path).to eq '/posts'
    end

    scenario 'user should be logged in to create a post' do
      visit '/'
      click_link 'Add a post'
      expect(current_path).to eq '/users/sign_in'
    end
  end

  context 'viewing posts' do

    let!(:pic){ Post.create(picture:'spec/images/test_pic.jpeg', title: 'Cute kitten') }

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Picture'
      expect(page).to have_content 'Cute kitten'
      expect(current_path).to eq "/posts/#{pic.id}"
    end
  end

  context 'editing posts' do
    scenario 'let a user edit a post' do
      user_sign_up
      create_post
      visit '/posts'
      click_link 'Picture'
      click_link 'Edit'
      attach_file 'post_picture', 'spec/images/test_pic.jpeg'
      fill_in 'post_title', with: 'Really cute kitten'
      click_button 'Update Post'
      expect(page).to have_content 'Really cute kitten'
      expect(current_path). to eq '/posts'
    end

    it 'user should not be able to edit a post it did not create' do
      user_sign_up
      create_post
      click_link 'Sign out'
      user_two_sign_up
      click_link 'Picture'
      click_link 'Edit'
      expect(page).to have_content('Error: You must be the author to edit a post')
    end
  end

  context 'deleting posts' do
    scenario 'removes a post when a user clicks a delete link' do
      user_sign_up
      create_post
      click_link 'Picture'
      click_link 'Delete'
      expect(page).not_to have_content 'Cute kitten'
      expect(page).to have_content 'Post deleted successfully'
    end

    it 'user should not be able to delete a post it did not create' do
      user_sign_up
      create_post
      click_link 'Sign out'
      user_two_sign_up
      click_link 'Picture'
      click_link 'Delete'
      expect(page).to have_content('Error: You must be the author to delete a post')
    end
  end

end

